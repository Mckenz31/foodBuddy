# api/admin.py
from django.contrib import admin
from .models import CustomUser, Product


@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    # Define any additional user-related admin configurations here
    pass


@admin.register(Product)
class CustomUserAdmin(admin.ModelAdmin):
    # Define any additional user-related admin configurations here
    pass
