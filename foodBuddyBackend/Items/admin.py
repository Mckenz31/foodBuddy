from django.contrib import admin
from .models import CustomUser, Items


@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    # Define any additional user-related admin configurations here
    pass


@admin.register(Items)
class CustomUserAdmin(admin.ModelAdmin):
    # Define any additional user-related admin configurations here
    pass
