# Determining the Incumbency Advantage Effects in Canadian Parliament (An Updated Study)

## Summary
I apply a regression discontinuity approach to determine incumbency advantages in the Canadian Parliament, finding that incumbents enjoy a 10.8–13.4% increased probability of winning over non-incumbents. I studied two different analyses depending on two breakout years of 1950 and 2011. I figured out that for the 1950 break out year, Liberals enjoyed a slightly more incumbency advantage than Conservatives for both pre and post 1950. My studies show that for the 2011 breakout year, Conservative party enjoyed a higher incumbency advantage than Liberals before 2011. Moreover, incumbency advantage increased significantly for Liberals after 2011 which they ran three governments out of four governments that spanned 2011 year and thereafter.

## Table of Contents
1. [Introduction](#1-introduction)
2. [Data](#2-data)
3. [Methodology](#3-methodology)
4. [Results](#4-results)
    - [Key Visualizations](#key-visualizations)
5. [Discussion](#5-discussion)
6. [Future Studies](#6-future-studies)
7. [References](#7-references)

## 1. Introduction
There have always been debates around whether incumbent candidates have an advantage in getting elected in subsequent elections. This study aims to measure the incumbency effect on the probability of winning and vote share in the Canadian parliament using a regression discontinuity (RD) approach.

## 2. Data
The dataset, sourced from the Library of Parliament of Canada, spans years from 1867 to 2021, covering all 44 parliaments. The data set contains candidate first and last name, constituency information, election dates, and votes received. Currently, there are 334 seats in the Canadian Parliament that each seat represents one constituency. In the Processed_Data file variables such as declaredwinner, marginal victory, and MVprev are introduced to identify incumbency and assess the margin of victory.

## 3. Methodology
Using a regression discontinuity model, the study estimates incumbency effects on winning probability. The model incorporates polynomial specifications and bandwidth choices to ensure robustness.

## 4. Results
The main results are based on the overall incumbency effect, showcasing the probability of winning for Liberals and Conservatives pre-1950, post-1950, pre-2011, and post-2011. Two key visualizations are presented:

### Key Visualization
Below graph

![Graph 1](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/g1.png)
*Caption: Combined (Liberal and Conservative) probability of winning, all time periods.*

For more detailed results, refer to the [full paper](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/Final%20MA%20Paper-%20Golbarg%20Kanani%20Samian.pdf).

## 5. Discussion
The discussion interprets the results, emphasizing the stronger incumbency effects for both Liberals and Conservatives before 1950. Additionally, it analyzes the notable increase in Liberal incumbency advantage post-2011, contrasting with the diminished significance for Conservatives.

## 7. References
This project is mostly based on the following papers:

- [Kendall and Rekkas (2012)](http://dx.doi.org/10.1111/j.15405982.2012.01739.x)

- [Lee (2008)](https://doi.org/10.1016/j.jeconom.2007.05.004)

