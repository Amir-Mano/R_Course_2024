# R course for beginners
# Final Assignment - data processing functions
# assignment by Amir Mano, id 205779788

### import libraries ----
library(tidyverse)
library(digest)

#### functions for data processing ----
fill_instrument_group <- function(df){
  df <- df |> 
    mutate(instrument_group = case_when(
      main_instrument %in% c("Trumpet", "French_Horn", "Bassoon", "Trombone", "Clarinet", 
                             "Saxophone", "Flute", "Sousaphone", "Tuba", "Oboe", "Recorder", "Harmonica") ~ "Wind",
      main_instrument %in% c("Piano", "Harpsichord") ~ "Keyboards",
      main_instrument %in% c("Bass_Guitar", "Guitar") ~ "Guitars",
      main_instrument %in% c("Violin", "Cello", "Viola", "Contrabass") ~ "Strings",
      main_instrument %in% c("Drum_Set", "Other_Drums") ~ "Drums",
      main_instrument %in% c("Vocal") ~ "Vocal",
      TRUE ~ "Other"
    ))
  return(df)
}

remove_nans <- function(df){
  remove_indexes <-is.na(df$main_instrument) | is.na(df$practice) 
  df<- df|> filter(!remove_indexes)
  df <- df |> select(sub_id, main_instrument, instrument_group, practice, AoO)
  return(df)
}

truncate_extreme_values <- function(df){
  df <- df |> mutate(practice = ifelse((practice>8*7), 8*7, practice)) #more than 8 hours a day is not reasonable
  df <- df |> mutate(practice = ifelse((practice<0), 0, practice)) #less than 0 hours a day is not reasonable
  df <- df |> mutate(AoO = ifelse((AoO<3), 3, AoO)) #less than 3-years-old is not reasonable
  df <- df |> mutate(AoO = ifelse((AoO>55), 55, AoO)) #all participants are younger than 55
  return(df)
}

create_binary_values <- function(df){
  df <- df |> mutate(is_wind = ifelse(grepl("Wind", instrument_group), 1,0))
  df <- df |> mutate(is_keyboard = ifelse(grepl("Keyboards", instrument_group), 1,0))
  return(df)
}

generate_anonymized_ids <- function(df) {
  df <- df |> 
    mutate(anonymized_id = sapply(sub_id, function(x) digest(x, algo = "md5"))) |> 
    arrange(anonymized_id) |>
    mutate(anonymized_id = paste0('id-', row_number()))
  df <- df |> mutate(original_id = sub_id)
  df <- df |> select(anonymized_id, main_instrument, instrument_group, practice, AoO)
  
  return(df)
}