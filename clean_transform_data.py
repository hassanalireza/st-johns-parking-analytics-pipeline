import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parents[1]
RAW_DIR = BASE_DIR / "data" / "raw"
PROCESSED_DIR = BASE_DIR / "data" / "processed"
PROCESSED_DIR.mkdir(parents=True, exist_ok=True)

def clean_text(value):
    if pd.isna(value):
        return value
    return str(value).strip().title()

def main():
    sessions = pd.read_csv(RAW_DIR / "raw_parking_sessions.csv")
    zones = pd.read_csv(RAW_DIR / "parking_zones.csv")
    weather = pd.read_csv(RAW_DIR / "weather_sample.csv")

    sessions["date"] = pd.to_datetime(sessions["date"])
    weather["date"] = pd.to_datetime(weather["date"])

    for col in ["street", "area", "payment_method", "vehicle_type"]:
        sessions[col] = sessions[col].apply(clean_text)

    sessions["vehicle_type"] = sessions["vehicle_type"].replace({"Suv": "SUV"})

    sessions["hours_parked"] = sessions["hours_parked"].fillna(sessions["hours_parked"].median())
    sessions["revenue"] = sessions["revenue"].fillna(
        (sessions["hours_parked"] * sessions["rate_per_hour"]).round(2)
    )

    sessions["month"] = sessions["date"].dt.strftime("%Y-%m")
    sessions["day_of_week"] = sessions["date"].dt.day_name()
    sessions["is_weekend"] = sessions["day_of_week"].isin(["Saturday", "Sunday"]).astype(int)

    final_df = sessions.merge(weather, on="date", how="left")

    final_df["snow_impact"] = final_df["snowfall_cm"].apply(
        lambda x: "High Snow" if x >= 5 else ("Low Snow" if x > 0 else "No Snow")
    )

    final_df.to_csv(PROCESSED_DIR / "clean_parking_analytics.csv", index=False)

    summary = final_df.groupby(["area", "street"], as_index=False).agg(
        total_sessions=("session_id", "count"),
        total_revenue=("revenue", "sum"),
        avg_hours_parked=("hours_parked", "mean"),
        avg_snowfall_cm=("snowfall_cm", "mean")
    )

    summary["total_revenue"] = summary["total_revenue"].round(2)
    summary["avg_hours_parked"] = summary["avg_hours_parked"].round(2)
    summary["avg_snowfall_cm"] = summary["avg_snowfall_cm"].round(2)

    summary.to_csv(PROCESSED_DIR / "parking_summary_by_area.csv", index=False)

    print("ETL completed successfully.")
    print(f"Rows processed: {len(final_df)}")

if __name__ == "__main__":
    main()
