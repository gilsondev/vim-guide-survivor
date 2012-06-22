# -*- coding: utf8 -*-

from django.shortcuts import render


def home(request):
    return render(request, 'subscription.html', {})
