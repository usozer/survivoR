#' Season summary
#'
#' A dataset containing a summary of all 40 seasons of survivor
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{Season name}
#'   \item{\code{season}}{Sesaon number}
#'   \item{\code{location}}{Location of the season}
#'   \item{\code{country}}{Country the season was held}
#'   \item{\code{tribe_setup}}{Initial setup of the tribe e.g. heroes vs Healers vs Hustlers}
#'   \item{\code{full_name}}{Full name of the winner}
#'   \item{\code{winner}}{Winner of the season}
#'   \item{\code{runner_ups}}{Runner ups for the season. Nested data from given there may be 2 runner ups and this preserves the grain of the data being a season}
#'   \item{\code{final_vote}}{Final vote allocation. See the \code{jury_votes} dataset for better aggregation of this data}
#'   \item{\code{timeslot}}{Timeslot of the show in the US}
#'   \item{\code{premiered}}{Date the first episode aired}
#'   \item{\code{ended}}{Date the season ended}
#'   \item{\code{filming_started}}{Date the filming of the season started}
#'   \item{\code{filming_ended}}{Date the filming ended (39 or 42 days after the start)}
#'   \item{\code{viewers_premier}}{Number of viewers (millions) who tuned in for the premier}
#'   \item{\code{viewers_finale}}{Number of viewers (millions) who tuned in for the finale}
#'   \item{\code{viewers_reunion}}{Number of viewers (millions) who tuned in for the reunion}
#'   \item{\code{viewers_mean}}{Average number of viewers (millions) who tuned in over the season}
#'   \item{\code{rank}}{Season rank}
#' }
#'
#' @import tidyr
#'
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
"season_summary"


#' Castaways
#'
#' A dataset containing details on the castaways for each season
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season}}{Sesaon number}
#'   \item{\code{season_name}}{Season name}
#'   \item{\code{full_name}}{Full name of the castaway}
#'   \item{\code{castaway}}{Name of castaway. Generally this is the name they were most commonly referred to
#'   or nickname e.g. no one called Coach, Benjamin. No one. He was simply Coach}
#'   \item{\code{age}}{Age of the castaway during the season they played}
#'   \item{\code{city}}{City of residence during the season they played}
#'   \item{\code{state}}{State of residence during the season they played}
#'   \item{\code{personality_type}}{The Myer-Briggs personality type of the castaway}
#'   \item{\code{day}}{Number of days the castaway survived. A missing value indicates they later returned to the game that season}
#'   \item{\code{order}}{Order in which castaway was voted out e.g. 5 is the 5th person voted of the island}
#'   \item{\code{result}}{Final result}
#'   \item{\code{jury_status}}{Jury status}
#'   \item{\code{original_tribe}}{Original tribe name}
#'   \item{\code{merged_tribe}}{Merged tribe name}
#'   \item{\code{swapped_tribe}}{Swapped tribe name}
#'   \item{\code{swapped_tribe2}}{second swapped tribe in the event of a second tribe swap or other tribe restructure such as absorbed tribe, outcasts, etc}
#'   \item{\code{total_votes_received}}{Total number of tribal votes received during the main game for a given season
#'   (not overall for those who have played more than once). This includes votes from ties}
#'   \item{\code{immunity_idols_won}}{The number of immunity idols won by a castaway for the given season}
#' }
#'
#' @import tidyr
#'
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
#' @examples
#' library(dplyr)
#' library(tidyr)
#' castaways %>%
#'   filter(season == 40)
"castaways"


#' Reward challenges
#'
#' A dataset containing details on the reward challenges for each season
#'
#' @format This nested tidy data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{Season name}
#'   \item{\code{season}}{Sesaon number}
#'   \item{\code{episode}}{Episode number of when the reward challenge was played}
#'   \item{\code{title}}{Episode title}
#'   \item{\code{day}}{Day of the immunity challenge rather than the reward (to be updated)}
#'   \item{\code{Reward}}{Winners of the reward challenge. Tidy data frame. See details for more}
#' }
#' @details This is a nested data frame since more than one person can win the reward.
#' The list of castaways include all those that participated in the reward rather than simply
#' the castaway that won the challenge. Many challenges in the merge are such that there is
#' one winner of the challenge and they can choose a set number of people to join them. Typically
#' the first person on the list is the person who won the challenge and other just participated
#' in the reward. In the case where castaways were split into teams for the challenge (post merge)
#' Technically they all won.
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
#' @examples
#' library(dplyr)
#' library(tidyr)
#' rewards
#' rewards %>%
#'   unnest(reward)
"rewards"

#' Immunity challenges
#'
#' A dataset containing details on the immunity challenges for each season
#'
#' @format This nested tidy data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{The season name}
#'   \item{\code{season}}{The season number}
#'   \item{\code{episode}}{Episode number of the immunity challenge was played}
#'   \item{\code{title}}{Episode title}
#'   \item{\code{voted_out}}{The castaway voted out}
#'   \item{\code{day}}{Day the castway or tribe won the immunity challenge}
#'   \item{\code{order}}{Order in which the castaway was voted off the island}
#'   \item{\code{immunity}}{Winners of the immunity challenge. Nested data frame}
#' }
#' @details Contains details on tribal immunity and individual immunity. Currently it does
#' not include details on hidden immunity idols. This will be added in time.
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
#' @examples
#' library(dplyr)
#' library(tidyr)
#' immunity
#' immunity %>%
#'   unnest(immunity)
"immunity"

#' Jury votes
#'
#' A dataset containing details on the final jury votes to determine the winner for each season
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{The season name}
#'   \item{\code{season}}{The season number}
#'   \item{\code{castaway}}{Name of the castaway}
#'   \item{\code{finalist}}{The finalists for which a vote can be placed}
#'   \item{\code{vote}}{Vote. 0-1 variable for easy summation}
#' }
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
#' @examples
#' library(dplyr)
#' jury_votes %>%
#'   filter(season == 40) %>%
#'   group_by(finalist) %>%
#'   summarise(votes = sum(vote))
"jury_votes"

#' Vote history
#'
#' A dataset containing details on the vote history for each season
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{The season name}
#'   \item{\code{season}}{The season number}
#'   \item{\code{episode}}{Episode number}
#'   \item{\code{day}}{Day the tribal council took place}
#'   \item{\code{tribe_status}}{The status of the tribe e.g. original, swapped, merged, etc. See details for more}
#'   \item{\code{castaway}}{Name of the castaway}
#'   \item{\code{immunity}}{Type of immunity held by the castaway at the time of the vote e.g. individual,
#'   hidden (see details for hidden immunity data)}
#'   \item{\code{vote}}{The castaway for which the vote was cast}
#'   \item{\code{nullified}}{Was the vote nullified by a hidden immunity idol? Logical}
#'   \item{\code{voted_out}}{The castaway who was voted out}
#'   \item{\code{order}}{The order in which the castaway was voted off the island}
#'   \item{\code{vote_order}}{In the case of ties this indicates the order the votes took place}
#' }
#' @details This data frame contains a complete history of votes cast across all seasons of Survivor. While there are consistent
#' events across the seasons there are some unique events such as the 'mutiny' in Survivor: Cook Islands (season 13)
#' or the 'Outcasts' in Survivor: Pearl Islands (season 7). For maintaining a standard, whenever there has been a change
#' in tribe for the castaways it has been recorded as \code{swapped}. \code{swapped} is used as the
#' term since 'the tribe swap' is a typical recurring milestone in each season of Survivor. Subsequent changes are recorded with
#' a trailing digit e.g. \code{swapped2}. This includes absorbed tribes e.g. Stephanie was 'absorbed'
#' in Survivor: Palau (season 10) and when 3 tribes are
#' reduced to 2. These cases are still considered 'swapped' to indicate a change in tribe status.
#'
#' Some events result in a castaway attending tribal but not voting. These are recorded as
#' \describe{
#'   \item{\code{Win}}{The castaway won the fire challenge}
#'   \item{\code{Lose}}{The castaway lost the fire challenge}
#'   \item{\code{None}}{The castaway did not cast a vote. This may be due to a vote steal or some other means}
#'   \item{\code{Immune}}{The castaway did not vote but were immune from the vote}
#' }
#'
#' Where a castaway has \code{immunity == 'hidden'} this means that player is protected by a hidden immunity idol. It may not
#' necessarily mean they played the idol, the idol may have been played for them. While the nullified votes data is complete
#' the \code{immunity} data does not include those who had immunity but did not receive a vote. This is a TODO.
#'
#' In the case where the 'steal a vote' advantage was played, there is a second row for the castaway that stole the vote.
#' The castaway who had their vote stolen are is recorded as \code{None}.
#'
#' Many castaways have been medically evacuated, quit or left the game for some other reason. In these cases where no votes
#' were cast there is a skip in the \code{order} variable. Since no votes were cast there is nothing to record on this
#' data frame. The correct order in which castaways departed the island is recorded on \code{castaways}.
#'
#' In the case of a tie, \code{voted_out} is recorded as \code{tie} to indicate no one was voted off the island in that
#' instance. The re-vote is recorded with \code{vote_order = 2} to indicate this is the second round of voting. In
#' the case of a second tie \code{voted_out} is recorded as \code{tie2}. The third step is either a draw of rocks,
#' fire challenge or countback (in the early days of survivor). In these cases \code{vote} is recorded as the colour of the
#' rock drawn, result of the fire challenge or 'countback'.
#'
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
#' @examples
#' # The number of times Tony voted for each castaway in Survivor: Winners at War
#' library(dplyr)
#' vote_history %>%
#'   filter(
#'     season == 40,
#'     castaway == "Tony"
#'   ) %>%
#'   count(vote)
"vote_history"

#' Tribe colours
#'
#' A dataset containing the tribe colours for each season
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{The season name}
#'   \item{\code{season}}{The season number}
#'   \item{\code{tribe}}{Tribe name}
#'   \item{\code{tribe_colour}}{Colour of the tribe}
#'   \item{\code{tribe_status}}{Tribe status e.g. original, swapped or merged. In the instance where a tribe is formed at the swap by
#'   splitting 2 tribes into 3, the 3rd tribe will be labelled 'swapped'}
#' }
#' @source \url{https://survivor.fandom.com/wiki/Tribe}
#' @examples
#' library(ggplot2)
#' library(dplyr)
#' library(forcats)
#' df <- tribe_colours %>%
#'   group_by(season_name) %>%
#'   mutate(
#'     xmin = 1,
#'     xmax = 2,
#'     ymin = 1:n(),
#'     ymax = ymin + 1
#'   ) %>%
#'   ungroup() %>%
#'   mutate(
#'     season_name = fct_reorder(season_name, season),
#'     font_colour = ifelse(tribe_colour == "#000000", "white", "black")
#'   )
#' ggplot() +
#'   geom_rect(data = df,
#'     mapping = aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax),
#'     fill = df$tribe_colour) +
#'   geom_text(data = df,
#'     mapping = aes(x = xmin+0.5, y = ymin+0.5, label = tribe),
#'     colour = df$font_colour) +
#'   theme_void() +
#'   facet_wrap(~season_name, scales = "free_y")
"tribe_colours"

#' Viewers
#'
#' A dataset containing the viewer history for each season and episode
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{The season name}
#'   \item{\code{season}}{Season number}
#'   \item{\code{episode_number_overall}}{The cumulative episode number}
#'   \item{\code{episode}}{Episode number for the season}
#'   \item{\code{title}}{Episode title}
#'   \item{\code{episode_date}}{Date the episode aired}
#'   \item{\code{viewers}}{Number of viewers (millions) who tuned in}
#'   \item{\code{rating_18_49}}{TV rating for the 18-49 aged group}
#'   \item{\code{share_18_49}}{TV share for the 18-49 aged group}
#' }
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
"viewers"

#' Season palettes
#'
#' A dataset containing palettes generated from the season logos
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season_name}}{The season name}
#'   \item{\code{season}}{The season number}
#'   \item{\code{palette}}{The season palette}
#' }
#' @source \url{https://en.wikipedia.org/wiki/Survivor_(American_TV_series)}
"season_palettes"
