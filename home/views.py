from django.shortcuts import render
from datetime import datetime

def index(request):
    current_datetime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    context = {
        'current_datetime': current_datetime
    }
    return render(request, 'home/index.html', context)

