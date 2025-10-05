# Build stage
FROM python:3.11-slim AS builder

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY src/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Production stage
FROM python:3.11-slim AS runner

WORKDIR /app

# Create non-root user for security
RUN groupadd --gid 1001 django && \
    useradd --uid 1001 --gid django --shell /bin/bash --create-home django

# Copy installed packages from builder
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy application code
COPY src/ .

# Create directory for static files
RUN mkdir -p /app/staticfiles

# Change ownership to django user
RUN chown -R django:django /app
USER django

EXPOSE 8000

ENV PORT=8000
ENV PYTHONUNBUFFERED=1

# Start the Django application with gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "helloworld.wsgi:application"]
