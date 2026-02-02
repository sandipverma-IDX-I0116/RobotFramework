from robot.api.deco import keyword
import datetime

@keyword
def diff(from_date, to_date):
    from_date = datetime.datetime.strptime(from_date, '%Y-%m-%d').date()
    to_date = datetime.datetime.strptime(to_date, '%Y-%m-%d').date()
    difference = abs(to_date - from_date)
    return difference.days

@keyword
def find_filename(path):
    file = path.split('\\')
    return file[-1]
