#!/bin/bash

function _remove_logs {

    LOG_FOLDER="$(pwd)/DocumentServer"
    sudo rm -rf $LOG_FOLDER/data/*
    sudo rm -rf $LOG_FOLDER/data/.private/*
    sudo rm -rf $LOG_FOLDER/db/*
    sudo rm -rf $LOG_FOLDER/lib/*
    sudo rm -rf $LOG_FOLDER/logs/*

}