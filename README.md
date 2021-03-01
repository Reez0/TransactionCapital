# TransactionCapital
Transaction Capital Technical Assesment

1. `pip install -r requirements.txt`
2. `cd transaction_capital`
3.  Modify database config in `settings.py`
4. `python manage.py makemigrations`
5. `python manage.py migrate`
6.  Add openweather api key to `APIKeys` table with `key_name` being 'openweathermap.org' and `key_value` the API key. Do the same for mapbox with `key_name` being 'mapbox.com' and `key_value` the API key.
7. `python manage.py runserver`
