# World Database Analysis

This project demonstrates various SQL queries to analyze data from a fictional "World" database. The database includes information about countries, cities, languages, and other demographic and geographic data. The queries showcase key SQL skills and are aimed at answering real-world questions.

---

## Table of Contents

1. [About the Database](#about-the-database)
2. [Setup](#setup)
3. [Analysis Queries](#analysis-queries)
4. [Key Insights](#key-insights)
5. [Technologies Used](#technologies-used)
6. [License](#license)
7. [Acknowledgments](#acknowledgments)

---

## About the Database

The database schema consists of three main tables:

- **city**: Contains details of cities, including their names, districts, population, and country codes.
- **country**: Holds information about countries, including their names, populations, life expectancies, and GDP (GNP).
- **countrylanguage**: Records languages spoken in each country, including whether they are official languages.

---

## Setup

To recreate the database and run the queries, follow these steps:

1. Use the `world_db.sql` script to create and populate the database:
   ```bash
   mysql -u [username] -p < world_db.sql
   ```
2. Open a SQL client (e.g., **MySQL Workbench**, **DBeaver**, or command-line interface) and connect to the database.
3. Copy and execute the analysis queries provided in `database_analysis-world_dataset.sql`.

---

## Analysis Queries
The following queries are included in the analysis:

1. **Display the first 10 records** from each table: `city`, `country`, and `countrylanguage`.
2. **Calculate the average population** of cities.
3. Identify the **country with the largest surface area**.
4. Determine the **average life expectancy** across countries.
5. Find the **most common language** (including non-official languages).
6. **List all cities** in a specific country (e.g., `USA`).
7. Retrieve **official languages** for a specific country (e.g., `Poland`).
8. Identify the **country with the highest number of cities**.
9. List **cities in the region with the highest population**.
10. Find the **country with the highest GDP (GNP)**.
11. Find the **country with the most languages**.
12. **List the top 5 most populous countries**.
13. Identify **cities with populations above the average**.
14. **Count how many countries are in each continent**.
15. **List official languages spoken in European countries**.
16. Find the **largest city by population in each country**.
17. Identify **countries with multiple official languages**.
18. **List cities in countries with GDP exceeding $1 trillion**.
19. Find the **top 5 regions with the highest average life expectancy**.
20. Identify **countries where English is an official language**.
21. Calculate the **population percentage of each city relative to its country**.

---

## Key Insights

- **Most populous cities and regions**: Useful for strategic planning.
- **Language data**: Insights into linguistic diversity and policy implications.
- **GDP analysis**: Highlights economic powerhouses with substantial urban centers.
- **Demographic statistics**: Average population and life expectancy assist in studies.

---

## Technologies Used

- **SQL**: Queries and analysis
- **MySQL**: Database management system
- **Database Client**: MySQL Workbench

---

## License

This project is licensed under the **MIT License**. See the LICENSE file for details.

---

## Acknowledgments

The database structure is inspired by the **World Sample Database**. Special thanks to the contributors of this schema for providing a comprehensive dataset.

---

Feel free to explore and adapt the queries for further analysis!
