from django.db import models
from django.contrib.auth.models import AbstractUser


class CustomUser(AbstractUser):
    # Add custom user fields here, if needed.
    pass


class Items(models.Model):
    name = models.CharField(max_length=100)
    quantity = models.PositiveIntegerField()
    expiration_date = models.DateField()
    category = models.CharField(max_length=50)

