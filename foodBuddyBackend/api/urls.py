# api/urls.py
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserList, UserDetail, recommend_items, ProductViewSet

router = DefaultRouter()
router.register(r'products', ProductViewSet)

urlpatterns = [
    path('users/', UserList.as_view(), name='user-list'),
    path('users/<int:pk>/', UserDetail.as_view(), name='user-detail'),
    path('recommend/', recommend_items, name='recommend-items'),
    path('', include(router.urls)),
]
