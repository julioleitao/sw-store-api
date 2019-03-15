# API Documentation

  * [StoreWeb.ProductController](#storeweb-productcontroller)
    * [index](#storeweb-productcontroller-index)
    * [create](#storeweb-productcontroller-create)
    * [show](#storeweb-productcontroller-show)
    * [update](#storeweb-productcontroller-update)
    * [delete](#storeweb-productcontroller-delete)
  * [StoreWeb.PromotionController](#storeweb-promotioncontroller)
    * [index](#storeweb-promotioncontroller-index)

## StoreWeb.ProductController
### <a id=storeweb-productcontroller-index></a>index
#### list all product
##### Request
* __Method:__ GET
* __Path:__ /api/products

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m4fg30eg7tas00000j2
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": [
    {
      "id": "60a86ba0-d70b-4fe5-8fac-36a4a96f0a38",
      "name": "Lápis de cor",
      "price": 100,
      "promotion_id": null
    }
  ]
}
```

### <a id=storeweb-productcontroller-create></a>create
#### create a new product
##### Request
* __Method:__ POST
* __Path:__ /api/products
* __Request headers:__
```
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "name": "Lápis de cor",
  "price": 100
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m4n0ama0odf8o0000l2
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "id": "f2ef06e4-0b86-49a1-b6f6-70e48c9507fe",
    "name": "Lápis de cor",
    "price": 100,
    "promotion_id": null
  }
}
```

#### a invalid product
##### Request
* __Method:__ POST
* __Path:__ /api/products
* __Request headers:__
```
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "name": null,
  "price": null
}
```

##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m4mqivd18kjso000111
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "errors": {
    "name": [
      "can't be blank"
    ],
    "price": [
      "can't be blank"
    ]
  }
}
```

### <a id=storeweb-productcontroller-show></a>show
#### retrieve a product
##### Request
* __Method:__ GET
* __Path:__ /api/products/8c7a69db-ecdd-49e0-a9da-261b6fc00282

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m4i40490ek0fo0000t1
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "id": "8c7a69db-ecdd-49e0-a9da-261b6fc00282",
    "name": "Lápis de cor",
    "price": 100,
    "promotion_id": null
  }
}
```

#### a inexisting product
##### Request
* __Method:__ GET
* __Path:__ /api/products/016c25fd-70e0-56fe-9d1a-56e80fa20b82

##### Response
* __Status__: 404
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m4j9t6khm590g0000u1
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "errors": {
    "detail": "Not Found"
  }
}
```

### <a id=storeweb-productcontroller-update></a>update
#### update a product
##### Request
* __Method:__ PUT
* __Path:__ /api/products/c0dd741b-37f4-4f00-9192-5f5e250a9b97
* __Request headers:__
```
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "name": "Lápis de cor raiz"
}
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m4bgqi311h9pg0000i4
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "id": "c0dd741b-37f4-4f00-9192-5f5e250a9b97",
    "name": "Lápis de cor raiz",
    "price": 100,
    "promotion_id": null
  }
}
```

### <a id=storeweb-productcontroller-delete></a>delete
#### delete a product
##### Request
* __Method:__ DELETE
* __Path:__ /api/products/5fd7bf6a-44d4-4493-a6f7-d44e870c1ba1

##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m3vfk6ngv5rsc0000g2
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json

```

## StoreWeb.PromotionController
### <a id=storeweb-promotioncontroller-index></a>index
#### retrieve the promotions available
##### Request
* __Method:__ GET
* __Path:__ /api/promotions

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m636m4qerpq1ldgkc000131
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": [
    {
      "id": "ecc0d36a-ec8a-42ff-be95-7943eb93201c",
      "name": "Pague 1 Leve 2"
    },
    {
      "id": "817e01e2-8ad8-4c00-91aa-82ee2902ad0f",
      "name": "3 por 10 reais"
    }
  ]
}
```

