# R course for beginners
# Final Assignment - data processing functions
# assignment by Amir Mano, id 205779788

### import libraries ----
library(tidyverse)

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

create_binary_values <- function(df){
  df <- df |> mutate(is_wind = ifelse(grepl("Wind", instrument_group), 1,0))
  df <- df |> mutate(is_keyboard = ifelse(grepl("Keyboards", instrument_group), 1,0))
  return(df)
}