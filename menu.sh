#!/bin/bash

while true; do
    echo "Menu:"
    echo "a. List all files in the present working directory"
    echo "b. Display today's date and time"
    echo "c. Display whether a file is a 'simple' file or a 'directory'"
    echo "d. Create a backup for a file using 'tar' command"
    echo "e. Compress the tar file"
    echo "f. Start an ftp session"
    echo "g. Start your LED control program"
    echo "h. Check disk usage"
    echo "i. Display network configuration"
    echo "j. Search for a keyword in files"
    echo "x. Exit"
    read -p "Enter option: " choice

    case $choice in
        a) ls -la ;;
        b) date ;;
        c) 
            read -p "Enter file name: " filename
            if [ -f "$filename" ]; then
                echo "$filename is a simple file."
            elif [ -d "$filename" ]; then
                echo "$filename is a directory."
            else
                echo "$filename does not exist."
            fi
            ;;
        d)
            read -p "Enter file name to backup: " filename
            tar -cvf "${filename}.tar" "$filename"
            echo "Backup created as ${filename}.tar"
            ;;
        e)
            read -p "Enter tar file name to compress: " tarfile
            gzip "$tarfile"
            echo "$tarfile compressed to ${tarfile}.gz"
            ;;
        f)
            read -p "Enter FTP domain or IP: " domain
            ftp "$domain"
            ;;
        g)
            python led_control.py
            ;;
        h) 
            df -h
            echo "Displayed disk usage."
            ;;
        i) 
            ifconfig
            echo "Displayed network configuration."
            ;;
        j)
            read -p "Enter keyword to search: " keyword
            grep -rnw '.' -e "$keyword"
            echo "Search completed."
            ;;
    	x)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done

