# COMP353/COMP5531 Summer 2025 - Warm-Up Project

## Team Members

This project is developed by a team of 4 members:

| Name                 | Student ID   | Email                      |
| -------------------- | ------------ | -------------------------- |
| Tonny Zhao           | 40283194     | z_tonny@encs.concordia.ca  |
| Harwinder Mann       | [Student ID] | m_harwin@encs.concordia.ca |
| Nicolas Sorescu      | [Student ID] | n_soresc@encs.concordia.ca |
| Patrick Jung-Woo Han | [Student ID] | pa_an@live.concordia.ca    |

## Project Overview

This repository contains the warm-up project for COMP353/COMP5531 Database Systems course, Summer 2025 semester. This project serves as an introduction to database design principles, SQL implementation, and collaborative database development using MySQL.

## Project Description

This is a preliminary database project designed to familiarize students with:

- **Database Design**: Creating normalized database schemas and entity-relationship diagrams
- **SQL Implementation**: Writing efficient DDL (Data Definition Language) and DML (Data Manipulation Language) statements
- **Query Development**: Developing complex queries including joins, subqueries, and aggregate functions
- **Data Management**: Understanding data integrity, constraints, and indexing strategies
- **Collaborative Development**: Working as a team on database projects using version control

## Getting Started

### Prerequisites

- MySQL Server 8.0+
- MySQL Workbench or command-line client
- Git for version control
- Text editor or IDE (VS Code recommended)

### Installation & Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/COMP353-Summer-2025/COMP353_warmup_project.git
   cd COMP353_warmup_project
   ```

2. **Set up MySQL Database**

   ```sql
   CREATE DATABASE comp353_warmup;
   USE comp353_warmup;
   ```

3. **Execute SQL Scripts**
   ```bash
   mysql -u [username] -p comp353_warmup < z_tonny.session.sql
   ```

## Usage

1. **Review Project Requirements**

   - Open and thoroughly read `Comp5531-Sum2025-WarmUp-Project.pdf`
   - Understand the database requirements and specifications

2. **Execute SQL Scripts**

   - Run the DDL scripts to create the database structure
   - Insert sample data using the provided DML scripts
   - Test all constraints and relationships

3. **Validate Implementation**
   - Run test queries to verify data integrity
   - Check that all requirements are met
   - Document any issues or findings

## Course Information

- **Course**: COMP353/COMP5531 - Database Systems
- **Semester**: Summer 2025
- **Institution**: [University Name]
- **Instructor**: [Professor Name]
- **Project Type**: Team Warm-up Assignment
- **Due Date**: [Insert Due Date]
