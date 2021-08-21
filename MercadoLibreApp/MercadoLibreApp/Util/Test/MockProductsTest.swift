//
//  MockProductsTest.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 20/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation
// swiftlint:disable function_body_length type_body_length line_length
class MockProductsTest {
    func getMockProductTest() -> String {
        let mockProducts = """
        {
            "site_id": "MLA",
            "query": "Motorola G6",
            "paging": {
                "total": 381,
                "offset": 0,
                "limit": 50,
                "primary_results": 86
            },
            "results": [
                {
                    "id": "MLA871811974",
                    "site_id": "MLA",
                    "title": "Moto G6 Plus 64 Gb Índigo Oscuro 4 Gb Ram",
                    "seller": {
                        "id": 288537838,
                        "permalink": "http://perfil.mercadolibre.com.ar/NOVA-SANTIAGO",
                        "registration_date": "2017-12-04T17:49:51.000-04:00",
                        "car_dealer": false,
                        "real_estate_agency": false,
                        "tags": [
                            "normal",
                            "user_info_verified",
                            "eshop",
                            "messages_as_seller"
                        ],
                        "eshop": {
                            "nick_name": "NOVA-SANTIAGO",
                            "eshop_rubro": null,
                            "eshop_id": 285859,
                            "eshop_locations": [],
                            "site_id": "MLA",
                            "eshop_logo_url": "http://resources.mlstatic.com/eshops/288537838v62f65f.png",
                            "eshop_status_id": 2,
                            "seller": 288537838,
                            "eshop_experience": 0
                        },
                        "seller_reputation": {
                            "transactions": {
                                "total": 60,
                                "canceled": 4,
                                "period": "historic",
                                "ratings": {
                                    "negative": 0,
                                    "positive": 0.9,
                                    "neutral": 0.1
                                },
                                "completed": 56
                            },
                            "power_seller_status": null,
                            "metrics": {
                                "claims": {
                                    "rate": 0,
                                    "value": 2,
                                    "period": "60 months"
                                },
                                "delayed_handling_time": {
                                    "rate": 0.1886,
                                    "value": 10,
                                    "period": "60 months"
                                },
                                "sales": {
                                    "period": "60 months",
                                    "completed": 56
                                },
                                "cancellations": {
                                    "rate": 0,
                                    "value": 0,
                                    "period": "60 months"
                                }
                            },
                            "level_id": "3_yellow"
                        },
                        "address": {
                            "zip_code": "4200",
                            "address": "24 DE SEPTIEMBRE 288",
                            "state": "AR-G",
                            "city": "Santiago del Estero"
                        }
                    },
                    "price": 45000,
                    "currency_id": "ARS",
                    "available_quantity": 1,
                    "sold_quantity": 0,
                    "buying_mode": "buy_it_now",
                    "listing_type_id": "gold_special",
                    "stop_time": "2040-07-31T04:00:00.000Z",
                    "condition": "new",
                    "permalink": "https://www.mercadolibre.com.ar/moto-g6-plus-64-gb-indigo-oscuro-4-gb-ram/p/MLA9452523",
                    "thumbnail": "http://mla-s1-p.mlstatic.com/909111-MLA31239994076_062019-I.jpg",
                    "accepts_mercadopago": true,
                    "installments": {
                        "quantity": 12,
                        "amount": 6381.38,
                        "rate": 70.17,
                        "currency_id": "ARS"
                    },
                    "address": {
                        "state_id": "AR-G",
                        "state_name": "Santiago del Estero",
                        "city_id": "TUxBQ1NBTmIwNDdm",
                        "city_name": "Santiago del Estero"
                    },
                    "shipping": {
                        "free_shipping": true,
                        "mode": "me2",
                        "tags": [
                            "mandatory_free_shipping"
                        ],
                        "logistic_type": "drop_off",
                        "store_pick_up": false
                    },
                    "seller_address": {
                        "id": "",
                        "comment": "",
                        "address_line": "",
                        "zip_code": "",
                        "country": {
                            "id": "AR",
                            "name": "Argentina"
                        },
                        "state": {
                            "id": "AR-G",
                            "name": "Santiago del Estero"
                        },
                        "city": {
                            "id": "TUxBQ1NBTmIwNDdm",
                            "name": "Santiago del Estero"
                        },
                        "latitude": "",
                        "longitude": ""
                    },
                    "attributes": [
                        {
                            "value_name": "Motorola",
                            "values": [
                                {
                                    "id": "2503",
                                    "name": "Motorola",
                                    "struct": null,
                                    "source": 1
                                }
                            ],
                            "attribute_group_id": "OTHERS",
                            "source": 1,
                            "id": "BRAND",
                            "value_id": "2503",
                            "attribute_group_name": "Otros",
                            "name": "Marca",
                            "value_struct": null
                        },
                        {
                            "values": [
                                {
                                    "source": 1,
                                    "id": "7477349",
                                    "name": "Adreno 508",
                                    "struct": null
                                }
                            ],
                            "attribute_group_name": "Otros",
                            "id": "GPU_MODEL",
                            "value_name": "Adreno 508",
                            "value_struct": null,
                            "source": 1,
                            "name": "Modelo de GPU",
                            "value_id": "7477349",
                            "attribute_group_id": "OTHERS"
                        },
                        {
                            "id": "ITEM_CONDITION",
                            "value_name": "Nuevo",
                            "value_struct": null,
                            "values": [
                                {
                                    "source": 3045741222775799,
                                    "id": "2230284",
                                    "name": "Nuevo",
                                    "struct": null
                                }
                            ],
                            "source": 3045741222775799,
                            "name": "Condición del ítem",
                            "value_id": "2230284",
                            "attribute_group_id": "OTHERS",
                            "attribute_group_name": "Otros"
                        },
                        {
                            "value_id": "3073863",
                            "value_name": "Moto G",
                            "value_struct": null,
                            "values": [
                                {
                                    "id": "3073863",
                                    "name": "Moto G",
                                    "struct": null,
                                    "source": 1
                                }
                            ],
                            "id": "LINE",
                            "name": "Línea",
                            "attribute_group_id": "OTHERS",
                            "attribute_group_name": "Otros",
                            "source": 1
                        },
                        {
                            "value_struct": null,
                            "name": "Modelo",
                            "value_id": "2915826",
                            "value_name": "G6 Plus",
                            "attribute_group_name": "Otros",
                            "source": 1,
                            "id": "MODEL",
                            "values": [
                                {
                                    "id": "2915826",
                                    "name": "G6 Plus",
                                    "struct": null,
                                    "source": 1
                                }
                            ],
                            "attribute_group_id": "OTHERS"
                        },
                        {
                            "id": "PROCESSOR_MODEL",
                            "name": "Modelo del procesador",
                            "value_id": "6900526",
                            "value_name": "Snapdragon 630",
                            "attribute_group_id": "OTHERS",
                            "attribute_group_name": "Otros",
                            "source": 1,
                            "value_struct": null,
                            "values": [
                                {
                                    "source": 1,
                                    "id": "6900526",
                                    "name": "Snapdragon 630",
                                    "struct": null
                                }
                            ]
                        }
                    ],
                    "original_price": null,
                    "category_id": "MLA1055",
                    "official_store_id": null,
                    "domain_id": "MLA-CELLPHONES",
                    "catalog_product_id": "MLA9452523",
                    "tags": [
                        "extended_warranty_eligible",
                        "good_quality_picture",
                        "immediate_payment",
                        "cart_eligible",
                        "shipping_guaranteed"
                    ],
                    "catalog_listing": true
                }
            ]
        }
        """
        return mockProducts
    }
}
