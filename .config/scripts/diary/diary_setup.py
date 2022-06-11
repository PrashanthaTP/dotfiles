#!E:/Programs/Python/python.exe
from datetime import datetime as dt
import logging
import os

logging.basicConfig(format="[%(levelname)s]  %(msg)s")
logger = logging.getLogger()
logger.setLevel(logging.WARNING)

curr_dir =  os.path.dirname(os.path.abspath(__file__))
DIARY_DIR=os.environ.get("DIARY_DIR",curr_dir)

def get_date():
    today = dt.now().date()

    date=today.day
    month=today.month
    year=today.year
    weekname = dt.today().strftime("%A")
    return date,month,year,weekname
    #return (f"{date}_{month}_{year}")

def get_diary_filename():
    date,month,year,weekname = get_date()
    filename = f"diary_{date}_{month}_{year}.md"
    return filename

def create_diary_file(filename,metadata):
    filepath = os.path.join(DIARY_DIR,filename)
    if os.path.isfile(filepath):
        return
    with open(filepath,'w') as file:
        for line in metadata:
            file.write(line)
            file.write("\n")
    logger.debug("File created : %s"%(filename))

def test_create_diary_file():
    date,month,year,weekname = get_date()
    filename = get_diary_filename()
    metadata = [f"{date}/{month},{year} {weekname}"]
    create_diary_file(filename,metadata)
    filepath = os.path.join(DIARY_DIR,filename)
    if(os.path.isfile(filepath)==True):
        logger.debug("test_create_diary_file : PASSED")


def main():
    date,month,year,weekname = get_date()
    filename = f"diary_{date}_{month}_{year}.md"
    metadata = [f"# {date}/{month},{year} {weekname}","\n"]
    create_diary_file(filename,metadata)
    test_create_diary_file()
    print(get_diary_filename())

if __name__=="__main__":
    main()


