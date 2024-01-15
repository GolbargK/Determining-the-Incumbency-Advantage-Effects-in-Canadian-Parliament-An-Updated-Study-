# Determining the Incumbency Advantage Effects in Canadian Parliament (An Updated Study)
<div align="justify">
  
## Summary
I applied a regression discontinuity approach to determine incumbency advantages in the Canadian Parliament, finding that incumbents enjoy a 10.8–13.4% increased probability of winning over non-incumbents. I studied two different analyses depending on two breakout years of 1950 and 2011. I figured out that for the 1950 break out year, Liberals enjoyed a slightly more incumbency advantage than Conservatives for both pre and post 1950. My studies show that for the 2011 breakout year, Conservative party enjoyed a higher incumbency advantage than Liberals before 2011. Moreover, incumbency advantage increased significantly for Liberals after 2011 which they ran three governments out of four governments that spanned 2011 year and thereafter.

## Table of Contents
1. [Introduction](#1-introduction)
2. [Data](#2-data)
3. [Methodology](#3-methodology)
4. [Results](#4-results)
5. [Key Visualization](#5-key-visualization)
6. [References](#7-references)

## 1. Introduction
There have always been debates around whether incumbent candidates have an advantage in getting elected in subsequent elections. This study aims to measure the incumbency effect on the probability of winning and vote share in the Canadian parliament using a regression discontinuity (RD) approach.

## 2. Data
[Original_Dataset.xlsx](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/Original_Dataset.xlsx), sourced from the Library of Parliament of Canada, spans years from 1867 to 2021, covering all 44 parliaments. The data set contains candidate first and last name, constituency information, election dates, and votes received. Currently, there are 334 seats in the Canadian Parliament that each seat represents one constituency. In the [Processed_Data.xslx](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/Processed_Data.xlsx) file variables such as declaredwinner, marginal victory, and MVprev are introduced to identify incumbency and assess the margin of victory. 

In order to go ahead with analysis and make a good comparison between incumbent parties to identify the incumbency advantage, I needed to identify the parties that were repeated during consecutive years. I matched the constituency name, province, and party name to see which parties have been repeated in consecutive parliaments. If a candidate was a repeated one, the dummy variable RepeatParty gets 1, and 0 otherwise.

To determine incumbency status, I needed to create a benchmark for incumbency. I defined a variable named marginal victory named as MV which for the winning party at each parliament and constituency is calculated by the number of votes they received minus the number of votes the second-ranked party received divided by the total votes in that parliament and specific constituency. MV for other candidates is calculated by the number of votes the party received minus the number of votes the winning party received divided by total valid votes in that parliament and specific constituency.

To see whether a candidate was an incumbent or not, I created another variable named MVprev which gives us the margin of victory in the previous parliament for the candidate. If MVprev is bigger than zero it means that the candidate was winner in last election; therefore, they were incumbent. A dummy variable here is made to indicate if the party was the incumbent or not. dummyMVprev gets 1 if MVprev is bigger than zero and it gets zero if MVprev is missing or less than zero. This is a determination of how to recognize previous incumbency.
declaredwinner is a dummy variable where it gets 1 if a candidate is elected and gets 0 if defeated.

## 3. Methodology
Using a regression discontinuity model, the study estimates incumbency effects on winning probability. The model incorporates polynomial specifications and bandwidth choices to ensure robustness.

Regression discontinuity is a statistical method used to estimate the causal effect of a treatment or intervention by exploiting a naturally occurring threshold or cutoff point. It is particularly useful in situations where individuals or units receive treatment based on a certain score or value of a continuous variable.

The basic idea behind regression discontinuity is that individuals just above and just below a threshold are expected to be similar in all characteristics, except for the treatment they receive due to the threshold. Therefore, any differences observed in outcomes between these two groups can be attributed to the treatment itself.

In this study, this treatment is incumbency in previous elections.

The RD model that I will use is:

Pijt = αi + βiDij,t−1 + γiMVij,t−1 + δiDij,t−1MVij,t−1 + εijt

Dij,t−1 is a dummy variable that takes one when MV is positive. The Greek letters are also parameters to be estimated. εijt is the error term. Pijt is probability of winning that takes value one when a party is a declared winner in election t and it takes value zero when the party is a loser. When using the whole sample for estimation, the parameter βi would be the overall incumbency effect. The interaction term should also be included in the model so that the functional form can differ between treated and untreated observations. As a normal RD approach, I would estimate the model using two linear models and a cubic and quartic form for margin of victory to test for robustness.


## 4. Results
For the whole sample, the overall incumbency effect on the probability of winning ranges from 10.8% to 13.4% and is significant at the 99% confidence interval level. According to this finding, incumbent parties are typically 13% more likely to win an election than non-incumbent parties. For a more detailed review of incumbency effect analysis for pre and post 2011 please refer to the [full paper](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/Final%20MA%20Paper-%20Golbarg%20Kanani%20Samian.pdf).

Below is a table of results:

![Table](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/Table%201.png)

## 5. Key Visualization
In the below graph, the results of a local linear regression for a bandwidth of 15% on each side of the threshold are plotted alongside the average likelihood of winning in each 1% bin of the margin of victory in the previous election. The graph combines data from all accessible time periods for Liberals and Conservatives-the main parties to study-. The regression discontinuity approach should produce meaningful results because we observe a distinct discontinuity at the zero margin of victory level.

![Graph 1](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/g1.png)
*Caption: Combined (Liberal and Conservative) probability of winning, all time periods.*

For more detailed results, refer to the [full paper](https://github.com/GolbargK/Determining-the-Incumbency-Advantage-Effects-in-Canadian-Parliament-An-Updated-Study-/blob/main/Final%20MA%20Paper-%20Golbarg%20Kanani%20Samian.pdf).

## 6. References
This project is mostly based on the following papers:

- [Kendall and Rekkas (2012)](http://dx.doi.org/10.1111/j.15405982.2012.01739.x)

- [Lee (2008)](https://doi.org/10.1016/j.jeconom.2007.05.004) </div>

