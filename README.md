# django-helloworld-app
A Django helloworld app for demoing and testing hosting infra EasyRunner.xyz

## Features
- Displays "Django Hello World!" with the current date and time
- Timestamp updates dynamically on each page refresh with second precision

## Setup and Run

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Run migrations:
```bash
python manage.py migrate
```

3. Start the development server:
```bash
python manage.py runserver
```

4. Open your browser and navigate to `http://localhost:8000/`

## Project Structure
- `helloworld/` - Django project configuration
- `home/` - Django app containing the home page view and template
- `requirements.txt` - Python dependencies
