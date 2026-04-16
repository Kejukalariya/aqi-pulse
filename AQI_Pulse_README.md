# AQI Pulse — India's Air Quality Intelligence & Health Risk Analyzer

## Project Overview
AQI Pulse is an end-to-end data analytics project that analyzes India's air quality across 26 cities from 2015 to 2020. The project goes beyond standard AQI reporting by layering health risk intelligence on top of pollution data — identifying which cities, seasons, and pollutants pose the greatest risk to human health.

This is Project 2 in my data analytics portfolio, built using Python, MySQL, and Power BI.

---

## Tools & Technologies
| Tool | Purpose |
|---|---|
| Python (pandas, numpy) | Data cleaning, feature engineering, EDA |
| MySQL Workbench | Database design, SQL analysis |
| Power BI | Interactive dashboard and data visualization |

---

## Dataset
- **Source:** Kaggle — Air Quality Data in India by Rohan Rao
- **File Used:** city_day.csv
- **Time Period:** January 2015 — July 2020
- **Cities:** 26 Indian cities
- **Raw Rows:** 29,531
- **Columns:** 16 (City, Date, PM2.5, PM10, NO, NO2, NOx, NH3, CO, SO2, O3, Benzene, Toluene, Xylene, AQI, AQI_Bucket)

---

## Project Workflow

```
Raw Data → Python EDA & Cleaning → MySQL Database → SQL Analysis → Power BI Dashboard
```

---

## Phase 1 — Python: Data Cleaning & Feature Engineering

### Columns Dropped
| Column | Reason |
|---|---|
| Xylene | 61% null values — unusable |
| Benzene | Not part of standard CPCB AQI calculation |
| Toluene | Not part of standard CPCB AQI calculation |
| NOx | Redundant — derived from NO + NO2 |

### Null Value Treatment
- Rows where AQI was null — dropped entirely (4,681 rows)
- Remaining nulls — filled using City + Month group mean
- Fallback — filled using City mean
- Genuine data gaps documented:
  - Lucknow — PM10 data unavailable throughout dataset
  - Ahmedabad — NH3 data unavailable throughout dataset
  - Ernakulam — O3 data unavailable throughout dataset

### Feature Engineering
Two new columns created:

**Dominant_Pollutant** — identifies the pollutant with the highest concentration for each city on each day using idxmax() across PM2.5, PM10, NO, NO2, NH3, CO, SO2, O3.

**PM2.5_Risk** — classifies each row into a health risk category based on CPCB PM2.5 standards:
| PM2.5 Value | Risk Level |
|---|---|
| 0 — 30 | Low |
| 31 — 60 | Medium |
| 61 — 90 | High |
| Above 90 | Very High |

### Final Cleaned Dataset
- Rows: 24,850
- Columns: 17
- Exported as: aqi_cleaned.csv

---

## Phase 2 — MySQL: Database Design & SQL Analysis

### Database
- Database name: aqi_pulse
- Table name: aqi_data
- Rows loaded: 24,850

### SQL Business Questions Answered

**Q1 — Which city has the highest average AQI?**
Ahmedabad — 452.12 (Severe category)

**Q2 — Which month is most polluted?**
November — Average AQI 241.68, followed by December and January

**Q3 — Which pollutant dominates India's air quality?**
PM10 — dominant on 19,025 out of 24,850 days (76% of all days)

**Q4 — Is AQI improving over the years?**
Yes — consistent decline from 212 in 2015 to 113 in 2020. 2020 drop largely attributed to COVID-19 lockdowns.

**Q5 — Which season has the worst air quality?**
Winter — Average AQI 220.61, followed by Post-Monsoon at 215.47

**Q6 — Which cities have the most Severe days?**
Ahmedabad — 638 Severe days, Delhi — 239, Patna — 174

**Q7 — Which cities improved the most from 2015 to 2020?**
Patna improved by 188 AQI points, Delhi by 115 points

**Q8 — What is the AQI difference between North and South India?**
North — 205.93 average AQI vs South — 102.20. North India has nearly double the pollution of South India.

---

## Phase 3 — Power BI: Dashboard

### Dashboard Pages

**Page 1 — National Overview**
KPI cards: Total Cities, Average AQI, Total Days, % Severe Days
Charts: AQI trend by Year, City vs Average AQI, Season vs Average AQI
Slicers: Year, Season

**Page 2 — City Deep Dive**
KPI cards: Most Polluted City, Cleanest City, Most Severe Days City
Charts: City vs AQI, Dominant Pollutant by City, PM2.5 Risk by City, AQI Bucket by City
Slicer: City

**Page 3 — Pollutant Intelligence**
Charts: Pollutant concentration trend 2015-2020, Dominant Pollutant share donut, Avg pollutant levels by Season, PM2.5 Risk by City
Slicers: City, Year, Season

**Page 4 — Health Risk Tracker**
KPI cards: % Very High PM2.5 Risk Days, Total Hazardous Days
Charts: PM2.5 Risk donut, AQI Bucket donut, PM2.5 Risk trend by Year
Slicer: City

---

## Key Insights

1. **Ahmedabad is India's most polluted city** with an average AQI of 452 — firmly in the Severe category. Nearly every second day in Ahmedabad recorded Severe air quality.

2. **PM10 drives 76% of India's pollution** — indicating that dust, construction activity, and road emissions are the primary culprits, not just vehicle exhaust or industrial gases.

3. **Winter is the most dangerous season** — Average AQI of 220 driven by temperature inversions, crop stubble burning in Punjab and Haryana, and cold air trapping pollutants at ground level.

4. **AQI declined consistently from 2015 to 2020** — dropping from 212 to 113. The dramatic 2020 drop to 113 is directly attributable to COVID-19 lockdowns halting industrial and vehicular activity across India.

5. **North India has double the pollution of South India** — North average AQI 206 vs South 102. Geography, landlocked terrain, agricultural burning, and industrial density create a stark air quality divide.

6. **South Indian cities benefit from natural air purification** — higher rainfall, coastal sea breezes from the Arabian Sea and Bay of Bengal, and dense vegetation continuously flush out pollutants.

7. **Patna showed the most improvement** — AQI dropped by 188 points from 2015 to 2020, the highest improvement of any Indian city in the dataset.

---

## Data Gaps & Limitations
- PM10 data unavailable for Lucknow throughout the dataset period
- NH3 data unavailable for Ahmedabad throughout the dataset period
- O3 data unavailable for Ernakulam throughout the dataset period
- 2020 data covers only January to July — full year comparison not possible
- AQI improvement in 2020 is partially attributable to COVID-19 lockdowns and may not reflect genuine long term improvement

---

## Project Structure
```
project_aqi_pulse/
│
├── data/
│   ├── city_day.csv
│   ├── stations.csv
│   └── aqi_cleaned.csv
│
├── notebooks/
│   └── aqi_eda.ipynb
│
├── sql/
│   └── aqi_analysis.sql
│
└── dashboard/
    └── aqi_pulse.pbix
```

---

## Author
**Keju**
Data Analytics Portfolio Project 2
Tools: Python | MySQL | Power BI
