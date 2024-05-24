from django.shortcuts import render
from django.shortcuts import get_object_or_404
from django.http import HttpResponse
from django.http import JsonResponse
import numpy as np
from scipy.ndimage import gaussian_filter
from PIL import Image as PILImage
import json
import base64
from django.views.decorators.csrf import csrf_exempt
from django.core.files.base import ContentFile
import io

def homePageView(request):
  print('Hello, World!')
  return HttpResponse('Hello, World!')

@csrf_exempt
def blur_and_download(request):
  data = json.loads(request.body)
  image_name = data['name']
  image_data = data['data']

  image_data = base64.b64decode(image_data)
  image = ContentFile(image_data, name=image_name)

  img = PILImage.open(io.BytesIO(image.read()))
  
  img_array = np.array(img)
  filtered_array = gaussian_filter(img_array, sigma=5)
  
  filtered_image = PILImage.fromarray(filtered_array)
  
  buffer = io.BytesIO()
  filtered_image.save(buffer, format='PNG')
  filtered_image_data = base64.b64encode(buffer.getvalue()).decode()

  return HttpResponse(json.dumps({'name': image_name, 'data': filtered_image_data}),
                      content_type="application/json", status=200)


@csrf_exempt
def blur_and_get(request):
  data = json.loads(request.body)
  image_data = data['data']

  image_data = base64.b64decode(image_data)
  image = ContentFile(image_data)

  img = PILImage.open(io.BytesIO(image.read()))
  
  img_array = np.array(img)
  filtered_array = gaussian_filter(img_array, sigma=5)
  
  filtered_image = PILImage.fromarray(filtered_array)
  
  buffer = io.BytesIO()
  filtered_image.save(buffer, format='PNG')
  filtered_image_data = base64.b64encode(buffer.getvalue()).decode()

  return HttpResponse(json.dumps({'data': filtered_image_data}),
                      content_type="application/json", status=200)



@csrf_exempt
def negative_and_download(request):
  data = json.loads(request.body)
  image_name = data['name']
  image_data = data['data']

  image_data = base64.b64decode(image_data)
  image = ContentFile(image_data, name=image_name)

  img = PILImage.open(io.BytesIO(image.read()))
  
  img_array = np.array(img)

  negative_array = 255 - img_array
  
  negative_image = PILImage.fromarray(negative_array)
  
  buffer = io.BytesIO()
  negative_image.save(buffer, format='PNG')
  negative_image_data  = base64.b64encode(buffer.getvalue()).decode()

  return HttpResponse(json.dumps({'name': image_name, 'data': negative_image_data}),
                      content_type="application/json", status=200)


@csrf_exempt
def negative_and_get(request):
  data = json.loads(request.body)
  image_data = data['data']

  image_data = base64.b64decode(image_data)
  image = ContentFile(image_data)

  img = PILImage.open(io.BytesIO(image.read()))
  
  img_array = np.array(img)

  negative_array = 255 - img_array
  
  negative_image = PILImage.fromarray(negative_array)
  
  buffer = io.BytesIO()
  negative_image.save(buffer, format='PNG')
  negative_image_data  = base64.b64encode(buffer.getvalue()).decode()

  return HttpResponse(json.dumps({'data': negative_image_data}),
                      content_type="application/json", status=200)