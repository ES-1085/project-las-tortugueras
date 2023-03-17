Las Tortugueras
================
by Sophie Chivers, Emily Rose Stringer and Georgia Lattig

## Summary

Our group worked closely with a community conservation organization in Mexico, El Grupo Tortuguero de Bahía de Kino (GTBK), to help organize and interpret their long term sea turtle monitoring data from the Gulf of California. This group is focused on monitoring turtle populations in the Gulf, and in particular, monitoring recaptures of sea turtles. To accomplish this monitoring they travel to offshore islands and local estuaries and capture turtles. In estuaries, they do this using nets, but on the islands, they catch the turtles by hand. Each turtle is tagged, weighed, and measured across multiple axes. Sophie spent this past fall term in Kino Bay, Mexico and worked with GTBK while she was there. We reached out to GTBK at the beginning of the term to see if they would be willing to let us use their data, and they were really excited about it. 

The target questions we were given by GTBK involved quantifying sea turtle recaptures and calculating survey effort, considering variables like species, sex, seasonality and location. The process of summarizing and visualizing GTBK's data required a lot of data cleaning and tidying. We began by organizing and merging two large datasets (dimensions of each, respectively) that collectively covered the group's sea turtle monitoring efforts from 2010-2022. We created several barcharts that looked at the demographics of the sea turtles captured by GTBK, colored by species and faceted by habitat type. GTBK encounters primarily Green sea turtles in estuary habitats. We also created both a bar chart and a heat map that explored the questions of the seasonality and temporality of sea turtle recaptures by GTBK. Both of these visualizations factored in effort by GTBK. Interestingly, the heat map revealed that GTBK almost always captures 1 sea turtle per outing and this was true regardless of which months the group went out. The bar chart that displayed the number of recaptures by month also showed no clear pattern in terms of the frequency of recaptures. GTBK does not seem to recapture tagged sea turtles more often in any one month or season of the year.

Once we had answered GTBK's questions, we had more freedom to do some exploratory data visualization. This is where we were able to incorporate comparisons between two different sea turtle monitoring projects and their findings. The Buck Island Sea Turtle Research Program (BISTRP) is a long term conservation and monitoring project by the National Park Service in the U.S. Virgin Islands. Their research efforts target the demographics of nesting Hawksbill and Green sea turtles on Buck Island and their nest success. Georgia spent last summer and fall working as a research technician for BISTRP. We were immediately curious about what comparisons, if any, we could draw between the two sea turtle monitoring organizations. The two projects are different in many ways. BISTRP monitors a nesting beach throughout the peak nocturnal nesting season and thus only encounters and surveys nesting females. GTBK conducts opportunistic in-water surveys and thus the demographics of the surveyed sea turtles are much more diverse. We created two visualizations exploring differences in the demographics of monitored sea turtles. One visualization that uused a combination of points, boxplots and violin plots compared carapace measurements of female Green sea turtles on Buck Island versus Kino Bay because both organizations collected these data. The results show that female Greens encountered and monitored by BISTRP are much larger than those encountered and monitored by GTBK. These results make sense from what we know about the females on Buck Island; all are at least of reproductive age (25-30 years old) and many are much older.

The final category of visualizations we made explored types of data visualization that were less familiar to us (Sankey diagrams and animations) and focused on the activities of individual turtles. In the field of wildlife biology and conservation, most of the data collected is about population trends and characteristics but it can be really interesting to study individual animals. The Sankey diagram explored the frequency and years of recaptures of the 9 most frequently captured sea turtles by GTBK. The time-enabled animation tracked the carapace growth of three individuals recaptured by GTBK: Elvia, Juana and Pepe. Each sea turtle grew in size between each recapture.

Overall, this project enabled us to use our new skills in coding and creating data visualizations to explore data that we were interested in (and had helped to collect)! Working with GTBK was especially gratifying because our calculations and visualizations will be used to help answer some of the group's target research questions. The experience taught us a lot about inheriting data from someone else and having to tidy it in R so that it could be used to answer questions. The experience also impressed on us the importance of collecting consistent and complete data. 

## Presentation

Our presentation can be found [here](https://docs.google.com/presentation/d/1xQokf4kLggq_BDt04svHl_0KVKK_AW0inhDp5nUpfAA/edit#slide=id.p).

## Data

Our data:

- Grupo Tortuguero Bahía de Kino, 2018, 2010-2018 Turtle Monitoring Dataset, data file. 
- Grupo Tortuguero Bahía de Kino, 2023, 2018-2023 Turtle Monitoring Dataset, data file. 
- Buck Island Sea Turtle Research Program, 2022, 2022 Female Sea Turtle Measurements Dataset, data file.

## References

Groupo Tortuguero Bahia de Kino (GTBK)
Buck Island Sea Turtle Research Program (BISTRP)
