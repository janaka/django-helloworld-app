# django-helloworld-app
A Django helloworld app for demoing and testing hosting infra EasyRunner.xyz

## Features
- Displays "Django Hello World!" with the current date and time
- Timestamp updates dynamically on each page refresh with second precision
- Simple, single-page application structure

## Project Structure
All application code is located in the `src` directory:
```
src/
├── helloworld/          # Django project configuration
│   ├── settings.py      # Project settings
│   ├── urls.py          # URL routing and view
│   ├── templates/       # HTML templates
│   │   └── index.html   # Home page template
│   ├── wsgi.py         # WSGI configuration
│   └── asgi.py         # ASGI configuration
├── manage.py           # Django management script
└── requirements.txt    # Python dependencies
```

## Setup and Run

1. Navigate to the source directory:
```bash
cd src
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run migrations:
```bash
python manage.py migrate
```

4. Start the development server:
```bash
python manage.py runserver
```

5. Open your browser and navigate to `http://localhost:8000/`

## Implementation
The application uses a simplified Django structure with the view defined directly in `urls.py`, eliminating the need for a separate app. This is ideal for simple, single-page applications.
