{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "12ea00f2-6123-4644-84e7-2f3f45104b05",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "49"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -40,
            "y": -136
          }
        },
        {
          "id": "f294cce9-d520-4691-9891-57b2e9662b09",
          "type": "basic.output",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "TX",
                "value": "61"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 472,
            "y": -120
          }
        },
        {
          "id": "314fff6c-8caa-4e10-a7c8-f8e0bc866d8c",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "DTR",
                "value": "52"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": -56
          }
        },
        {
          "id": "baa97a1d-08df-45a4-835f-9076539a39cc",
          "type": "basic.output",
          "data": {
            "name": "D",
            "range": "[4:0]",
            "pins": [
              {
                "index": "4",
                "name": "LED4",
                "value": "41"
              },
              {
                "index": "3",
                "name": "LED3",
                "value": "42"
              },
              {
                "index": "2",
                "name": "LED2",
                "value": "43"
              },
              {
                "index": "1",
                "name": "LED1",
                "value": "44"
              },
              {
                "index": "0",
                "name": "LED0",
                "value": "45"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 496,
            "y": -40
          }
        },
        {
          "id": "8c898076-5393-4f25-ae59-8272cb54fdc4",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "RX",
                "value": "62"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 16
          }
        },
        {
          "id": "ac824ce9-e479-4150-9f46-0978e99540bb",
          "type": "basic.code",
          "data": {
            "code": "// @include top.v\n// @include j1.v\n// @include j1a.v\n// @include mem.v\n// @include stack2.v\n// @include uart.v\n// @include nuc.list\n \n j1a U1 (\n    .pclk(pclk),\n    .TX(TX),\n    .RX(RX),\n    .D(D),\n    .resetq(resetq));",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "pclk"
                },
                {
                  "name": "resetq"
                },
                {
                  "name": "RX"
                }
              ],
              "out": [
                {
                  "name": "TX"
                },
                {
                  "name": "D",
                  "range": "[4:0]",
                  "size": 5
                }
              ]
            }
          },
          "position": {
            "x": 112,
            "y": -144
          },
          "size": {
            "width": 296,
            "height": 232
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "314fff6c-8caa-4e10-a7c8-f8e0bc866d8c",
            "port": "out"
          },
          "target": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "resetq"
          }
        },
        {
          "source": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "D"
          },
          "target": {
            "block": "baa97a1d-08df-45a4-835f-9076539a39cc",
            "port": "in"
          },
          "size": 5
        },
        {
          "source": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "TX"
          },
          "target": {
            "block": "f294cce9-d520-4691-9891-57b2e9662b09",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "8c898076-5393-4f25-ae59-8272cb54fdc4",
            "port": "out"
          },
          "target": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "RX"
          }
        },
        {
          "source": {
            "block": "12ea00f2-6123-4644-84e7-2f3f45104b05",
            "port": "out"
          },
          "target": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "pclk"
          }
        }
      ]
    }
  },
  "dependencies": {}
}