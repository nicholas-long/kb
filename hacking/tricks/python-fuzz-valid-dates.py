from datetime import datetime, timedelta
# fuzz valid dates
dates = [(datetime.today() - timedelta(days=x)).strftime('%Y-%m-%d') for x in range(0, 365)]
for d in dates:
    print(d)
