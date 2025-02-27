#!/bin/bash

# Checking the command line arguments
if [[ $# -ne 3 ]];then
    echo -e "\nERROR: Input values such as source, backup, file extension are missing\n"
    exit 1
fi

# Storing the Command line arguments
SOURCE=$1
BACKUP=$2
FILE_EXT=$3
echo -e "\nSource file path : $SOURCE"
echo "Backup file path : $BACKUP"
echo -e "File extension   : $FILE_EXT\n"

# Checking whether the source directory exists or not
if [[ ! -d "$SOURCE" ]];then
    echo "ERROR: Directory $SOURCE doesn't exist"
    exit 1
else
    echo "Directory $SOURCE already exists"
    no_files=$(ls "$SOURCE"| wc -l) 
    if [[ $no_files -eq 0 ]];then   # Checking the directory is empty
        echo -e "\nDirectory $SOURCE is empty\n"
	exit 1
    fi
fi

# Checking whether the backup directory exists or not
if [[ ! -d "$BACKUP" ]];then
    mkdir "$BACKUP"
    if [[ $? -eq 0 ]];then
        echo -e "\nDirectory $BACKUP created successfully!!!"
    else
        echo -e "\nERROR: Directory $BACKUP creation failed!!!"
        exit 1
    fi
else
    echo -e "\nDirectory $BACKUP already exists!!!"
fi

# Extracting the extension file from the source directory
FILES=("$SOURCE"/*"$FILE_EXT")
if [[ ${#FILES[@]} -eq 0 ]];then
     echo -e "\nERROR: Matching $FILE_EXT files not present\n"
     exit 1
fi

# Backing up the files 
echo -e "\n*** Backing up files with their sizes ***\n"
TOTAL_SIZE=0  # to store total bytes been backedup
BACKUP_COUNT=0  # to store total no of files been backedup
for FILE in "${FILES[@]}";do
    SIZE=$(wc -c < "$FILE")
    DEST_FILE="$BACKUP"/$(basename "$FILE")
    TOTAL_SIZE=$((SIZE+TOTAL_SIZE))
    if [[ -f "$DEST_FILE" ]];then
        if [[ "$FILE" -nt "$DEST_FILE" ]];then
             cp "$FILE" "$DEST_FILE"
        fi
    else
	cp "$FILE" "$DEST_FILE"
    fi
    ((BACKUP_COUNT++))
    echo -e "$BACKUP_COUNT) FILE : $FILE \t SIZE : $SIZE bytes"
done
echo -e "\nFiles Successfully backed up to $BACKUP directory"

# Generating a backup report
export BACKUP_COUNT
REPORT_FILE="$BACKUP"/backup_report.log
REPORT_DATE=$(date)
{
echo "--------------------------------------------------------------------"
echo "BackUp Report Summary on $REPORT_DATE:"
echo "--------------------------------------------------------------------"
echo ""
echo "  Total files processed           : ${#FILES[@]}"
echo "  Total size of files backed up   : $TOTAL_SIZE bytes"
echo "  Path to the backup directory    : $BACKUP"
echo ""
echo "--------------------------------------------------------------------"
} > "$REPORT_FILE"
echo -e "\nBackup summary report saved successfully at $REPORT_FILE on $REPORT_DATE\n"

