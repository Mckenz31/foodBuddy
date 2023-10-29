from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserList, UserDetail, recommend_items, ItemsViewSet

router = DefaultRouter()
router.register(r'items', ItemsViewSet)

urlpatterns = [
    path('users/', UserList.as_view(), name='user-list'),
    path('users/<int:pk>/', UserDetail.as_view(), name='user-detail'),
    path('recommend/', recommend_items, name='recommend-items'),
    path('', include(router.urls)),
]
