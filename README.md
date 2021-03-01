# TransactionCapital
Transaction Capital Technical Assesment

1. `pip install -r requirements.txt`
2. `cd transaction_capital`
3. `python manage.py makemigrations`
4. `python manage.py migrate`
5.  Add openweather api key to `APIKeys` table with `key_name` being 'openweathermap.org' and `key_value` the API key. Do the same for mapbox with `key_name` being 'mapbox.com' and `key_value` the API key.
6. `python manage.py runserver`
