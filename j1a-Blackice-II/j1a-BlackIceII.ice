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
    "board": "blackice-ii",
    "graph": {
      "blocks": [
        {
          "id": "51ffc131-a0be-4402-8d8a-d493aa097f71",
          "type": "basic.output",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "P13",
                "value": "85"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 272,
            "y": -584
          }
        },
        {
          "id": "474f9a61-9b0b-45a7-8ac1-13757b0a9153",
          "type": "basic.output",
          "data": {
            "name": "LEDs",
            "range": "[4:0]",
            "pins": [
              {
                "index": "4",
                "name": "P71",
                "value": "9"
              },
              {
                "index": "3",
                "name": "LED4",
                "value": "70"
              },
              {
                "index": "2",
                "name": "LED3",
                "value": "68"
              },
              {
                "index": "1",
                "name": "LED2",
                "value": "67"
              },
              {
                "index": "0",
                "name": "LED1",
                "value": "71"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 296,
            "y": -480
          }
        },
        {
          "id": "432c7d63-4397-42f2-8b6f-7c2365ceb2f6",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "129"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -504,
            "y": -456
          }
        },
        {
          "id": "65e5ed38-6c4c-4aab-8069-c328e953e98c",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "P12",
                "value": "88"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -96,
            "y": -416
          }
        },
        {
          "id": "b4a861ea-9121-417f-b572-c2009e607e72",
          "type": "basic.output",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "P72",
                "value": "2"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": -136,
            "y": -312
          }
        },
        {
          "id": "a3673c34-8dd7-4d67-9edb-92df1a31e58e",
          "type": "basic.constant",
          "data": {
            "name": "Nucleus",
            "value": "\"nuc.list\"",
            "local": false
          },
          "position": {
            "x": 72,
            "y": -536
          }
        },
        {
          "id": "3c8e0ab1-5c56-48a0-881e-ddcf94bf771a",
          "type": "basic.info",
          "data": {
            "info": "## J1a-simple Test\n\n* Upload the circuit into the FPGA board \n* Open the terminal: 230400 bauds\n\nPress ENTER. Your Forth machine is ready!\n\n\n\n",
            "readonly": false
          },
          "position": {
            "x": -48,
            "y": -784
          },
          "size": {
            "width": 416,
            "height": 152
          }
        },
        {
          "id": "150557d5-f1c8-449d-acc2-5e4129b4b113",
          "type": "99eb5dbfb1c007cae18a9598287afbc469f6b860",
          "position": {
            "x": 72,
            "y": -432
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "91e60f82-ec44-4f96-a768-f116eb2b1603",
          "type": "basic.info",
          "data": {
            "info": "**Hello world example**:\n\n1 + 2 = 3\n\n```\n1 2 + . <ENTER>\n```\n",
            "readonly": true
          },
          "position": {
            "x": 464,
            "y": -808
          },
          "size": {
            "width": 224,
            "height": 120
          }
        },
        {
          "id": "46b89b0b-5acd-45d6-8f05-4fda5922c2e2",
          "type": "basic.info",
          "data": {
            "info": "**Turning on the leds**\n\n```\n$1f leds\n```\n**Binary counter**\n\n```\n: blink 32 0 do i leds 10 ms loop ;\nblink\n```",
            "readonly": true
          },
          "position": {
            "x": 464,
            "y": -656
          },
          "size": {
            "width": 328,
            "height": 200
          }
        },
        {
          "id": "48d00cfd-cae8-4a08-9a15-3644b90d7620",
          "type": "3ba8d67fb4058347750139ac572144a6dc8c0cc7",
          "position": {
            "x": -312,
            "y": -456
          },
          "size": {
            "width": 96,
            "height": 64
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "65e5ed38-6c4c-4aab-8069-c328e953e98c",
            "port": "out"
          },
          "target": {
            "block": "150557d5-f1c8-449d-acc2-5e4129b4b113",
            "port": "c561caf2-9e7f-4754-bf15-632fa9fbaa61"
          }
        },
        {
          "source": {
            "block": "150557d5-f1c8-449d-acc2-5e4129b4b113",
            "port": "72931e85-4289-4b63-a89a-ca018503c005"
          },
          "target": {
            "block": "474f9a61-9b0b-45a7-8ac1-13757b0a9153",
            "port": "in"
          },
          "size": 5
        },
        {
          "source": {
            "block": "150557d5-f1c8-449d-acc2-5e4129b4b113",
            "port": "8d1dc17a-f5c2-4a52-bebd-48a895d6ac51"
          },
          "target": {
            "block": "51ffc131-a0be-4402-8d8a-d493aa097f71",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "a3673c34-8dd7-4d67-9edb-92df1a31e58e",
            "port": "constant-out"
          },
          "target": {
            "block": "150557d5-f1c8-449d-acc2-5e4129b4b113",
            "port": "aaf7ba00-0115-4d36-b84b-5460d800c56c"
          }
        },
        {
          "source": {
            "block": "432c7d63-4397-42f2-8b6f-7c2365ceb2f6",
            "port": "out"
          },
          "target": {
            "block": "48d00cfd-cae8-4a08-9a15-3644b90d7620",
            "port": "16882ac1-42c7-4496-92f8-601b85af447e"
          }
        },
        {
          "source": {
            "block": "48d00cfd-cae8-4a08-9a15-3644b90d7620",
            "port": "640a6582-5f0d-45fa-9b5a-a78e8177b85f"
          },
          "target": {
            "block": "150557d5-f1c8-449d-acc2-5e4129b4b113",
            "port": "260f3e2d-cae1-4c7b-9a94-7c703a4214fc"
          }
        },
        {
          "source": {
            "block": "48d00cfd-cae8-4a08-9a15-3644b90d7620",
            "port": "69e81b91-3ebf-4c1a-b708-63e6c46046c4"
          },
          "target": {
            "block": "b4a861ea-9121-417f-b572-c2009e607e72",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {
    "99eb5dbfb1c007cae18a9598287afbc469f6b860": {
      "package": {
        "name": "J1a-simple",
        "version": "0.1",
        "description": "J1a-simple Forth processor",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%220%200%20222.08599%20222.08601%22%20height=%22296.115%22%20version=%221.2%22%20width=%22296.115%22%3E%3Cdesc%3EFritzing%20breadboard%20generated%20by%20brd2svg%3C/desc%3E%3Cg%20transform=%22scale(4.477)%20rotate(90%2025.1%2024.8)%22%20stroke-width=%220%22%3E%3Cpath%20fill=%22#8c8c8c%22%20d=%22M49.906%208.587h-4.252v-.992h4.252zM49.906%2010.003h-4.252v-.992h4.252zM49.906%2011.421h-4.252v-.992h4.252zM49.906%2012.839h-4.252v-.992h4.252zM49.906%2014.255h-4.252v-.992h4.252zM49.906%2015.673h-4.252v-.992h4.252zM49.906%2017.09h-4.252V16.1h4.252zM49.906%2018.507h-4.252v-.992h4.252zM49.906%2019.925h-4.252v-.992h4.252zM49.906%2021.343h-4.252v-.992h4.252zM49.906%2022.76h-4.252v-.992h4.252zM49.906%2024.177h-4.252v-.992h4.252zM49.906%2025.595h-4.252v-.992h4.252zM49.906%2027.011h-4.252v-.992h4.252zM49.906%2028.429h-4.252v-.992h4.252zM49.906%2029.846h-4.252v-.992h4.252zM49.906%2031.264h-4.252v-.992h4.252zM49.906%2032.68h-4.252v-.991h4.252zM49.906%2034.098h-4.252v-.992h4.252zM49.906%2035.516h-4.252v-.992h4.252zM49.906%2036.932h-4.252v-.992h4.252zM49.906%2038.35h-4.252v-.992h4.252zM49.906%2039.768h-4.252v-.992h4.252zM49.906%2041.184h-4.252v-.992h4.252zM49.906%2042.602h-4.252v-.992h4.252zM42.608%2049.902h-.992V45.65h.992zM41.19%2049.902h-.992V45.65h.992zM39.772%2049.902h-.992V45.65h.992zM38.356%2049.902h-.992V45.65h.992zM36.938%2049.902h-.992V45.65h.992zM35.52%2049.902h-.991V45.65h.992zM34.104%2049.902h-.992V45.65h.992zM32.686%2049.902h-.992V45.65h.992zM31.269%2049.902h-.992V45.65h.992zM29.851%2049.901h-.992V45.65h.992zM28.434%2049.901h-.992V45.65h.992zM27.017%2049.901h-.992V45.65h.992zM25.6%2049.901h-.993V45.65h.992zM24.183%2049.901h-.992V45.65h.992zM22.765%2049.901h-.992V45.65h.992zM21.347%2049.901h-.992V45.65h.992zM19.93%2049.901h-.991V45.65h.992zM18.513%2049.901h-.992V45.65h.992zM17.095%2049.901h-.992V45.65h.992zM15.679%2049.901h-.992V45.65h.992zM14.261%2049.901h-.992V45.65h.992zM12.843%2049.901h-.992V45.65h.992zM11.427%2049.901h-.992V45.65h.992zM10.01%2049.901h-.993V45.65h.992zM8.592%2049.901H7.6V45.65h.992zM4.553%2042.602H.3v-.992h4.252zM4.553%2041.184H.3v-.992h4.252zM4.553%2039.768H.3v-.992h4.252zM4.553%2038.35H.3v-.992h4.252zM4.553%2036.932H.3v-.992h4.252zM4.553%2035.516H.3v-.992h4.252zM4.553%2034.098H.3v-.992h4.252zM4.553%2032.68H.3v-.991h4.252zM4.553%2031.264H.3v-.992h4.252zM4.553%2029.846H.3v-.992h4.252zM4.553%2028.429H.3v-.992h4.252zM4.553%2027.011H.3v-.992h4.252zM4.553%2025.595H.3v-.992h4.252zM4.553%2024.177H.3v-.992h4.252zM4.553%2022.76H.3v-.992h4.252zM4.553%2021.343H.3v-.992h4.252zM4.553%2019.925H.3v-.992h4.252zM4.553%2018.507H.3v-.992h4.252zM4.553%2017.09H.3V16.1h4.252zM4.553%2015.673H.3v-.992h4.252zM4.553%2014.255H.3v-.992h4.252zM4.553%2012.839H.3v-.992h4.252zM4.553%2011.421H.3v-.992h4.252zM4.553%2010.003H.3v-.992h4.252zM4.553%208.587H.3v-.992h4.252zM8.592%204.547H7.6V.295h.992zM10.01%204.547h-.993V.295h.992zM11.427%204.547h-.992V.295h.992zM12.843%204.547h-.992V.295h.992zM14.261%204.547h-.992V.295h.992zM15.679%204.547h-.992V.295h.992zM17.095%204.547h-.992V.295h.992zM18.513%204.547h-.992V.295h.992zM19.93%204.547h-.991V.295h.992zM21.347%204.547h-.992V.295h.992zM22.765%204.547h-.992V.295h.992zM24.183%204.547h-.992V.295h.992zM25.6%204.547h-.993V.295h.992zM27.017%204.547h-.992V.295h.992zM28.434%204.547h-.992V.295h.992zM29.851%204.547h-.992V.295h.992zM31.269%204.547h-.992V.295h.992zM32.686%204.547h-.992V.295h.992zM34.104%204.547h-.992V.295h.992zM35.52%204.547h-.991V.295h.992zM36.938%204.547h-.992V.295h.992zM38.356%204.547h-.992V.295h.992zM39.772%204.547h-.992V.295h.992zM41.19%204.547h-.992V.295h.992zM42.608%204.547h-.992V.295h.992z%22/%3E%3Cpath%20fill=%22#303030%22%20d=%22M5.258%205.258h39.685v39.685H5.258z%22/%3E%3Cpath%20fill=%22#1f1f1f%22%20d=%22M5.258%205.258h39.685l-.72.72H5.978zM5.258%2044.943h39.685l-.72-.72H5.978z%22/%3E%3Cpath%20d=%22M5.258%205.258v39.685l.72-.72V5.978z%22/%3E%3Cpath%20fill=%22#3d3d3d%22%20d=%22M44.943%205.258v39.685l-.72-.72V5.978z%22/%3E%3Ccircle%20r=%22.72%22%20cy=%2242.783%22%20cx=%227.418%22%20fill=%22#1f1f1f%22/%3E%3C/g%3E%3Ctext%20y=%2273.076%22%20x=%2267.594%22%20style=%22line-height:1.25;-inkscape-font-specification:ubuntu;text-align:start%22%20font-weight=%22400%22%20font-size=%2250.208%22%20font-family=%22ubuntu%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#ff0%22%20stroke-width=%223.138%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'ubuntu%20Medium'%22%20y=%2273.076%22%20x=%2267.594%22%20font-weight=%22500%22%3EJ1a%3C/tspan%3E%3C/text%3E%3Ctext%20y=%22122.475%22%20x=%2272.947%22%20style=%22line-height:1.25;-inkscape-font-specification:ubuntu;text-align:start%22%20font-weight=%22400%22%20font-size=%2234.387%22%20font-family=%22ubuntu%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#fff%22%20stroke-width=%222.149%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'ubuntu%20Medium'%22%20y=%22122.475%22%20x=%2272.947%22%20font-weight=%22500%22%3ESOC%3C/tspan%3E%3C/text%3E%3Ctext%20style=%22line-height:1.25;-inkscape-font-specification:ubuntu;text-align:start%22%20x=%2249.543%22%20y=%22177.372%22%20font-weight=%22400%22%20font-size=%2250.208%22%20font-family=%22ubuntu%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#0ff%22%20stroke-width=%223.138%22%3E%3Ctspan%20x=%2249.543%22%20y=%22177.372%22%20style=%22-inkscape-font-specification:'ubuntu%20Medium'%22%20font-weight=%22500%22%3EForth%3C/tspan%3E%3C/text%3E%3C/svg%3E",
        "otid": 1585335744761
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "0f7aee1e-a902-4f01-8394-d64d85f1e2b5",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 2112,
                "y": 32
              }
            },
            {
              "id": "8d1dc17a-f5c2-4a52-bebd-48a895d6ac51",
              "type": "basic.output",
              "data": {
                "name": "tx",
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
                "x": 2480,
                "y": 40
              }
            },
            {
              "id": "cc1c336f-e0ab-4e27-81f6-ac7b2dc3efd5",
              "type": "basic.outputLabel",
              "data": {
                "name": "do",
                "range": "[7:0]",
                "pins": [
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 2112,
                "y": 104
              }
            },
            {
              "id": "260f3e2d-cae1-4c7b-9a94-7c703a4214fc",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": -112,
                "y": 104
              }
            },
            {
              "id": "9aee792a-413f-48b7-bd5d-65a3a353e408",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true
              },
              "position": {
                "x": 40,
                "y": 104
              }
            },
            {
              "id": "e1a76828-11ec-4932-95af-978420a102db",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "io_wr",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1264,
                "y": 136
              }
            },
            {
              "id": "76826995-bc5a-4a0d-a510-b3f5fa5ba1ef",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_busy",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 2480,
                "y": 144
              }
            },
            {
              "id": "decb0eac-dce2-4e32-b7e5-430f5c311b79",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_rd",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1816,
                "y": 144
              }
            },
            {
              "id": "2b458f43-dcde-491e-bcee-a074542e4ecf",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_wr",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 2120,
                "y": 176
              }
            },
            {
              "id": "34fd1cdb-fc0c-466b-82f2-f93fc1841f3d",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "io_rd",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1232,
                "y": 192
              }
            },
            {
              "id": "36c09412-6015-4849-85bc-27e028547741",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_wr",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1816,
                "y": 216
              }
            },
            {
              "id": "c561caf2-9e7f-4754-bf15-632fa9fbaa61",
              "type": "basic.input",
              "data": {
                "name": "rx",
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
                "x": -112,
                "y": 224
              }
            },
            {
              "id": "5f3bc26e-80a8-429b-bd7a-4091a8dbc93b",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "rx",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true
              },
              "position": {
                "x": 40,
                "y": 224
              }
            },
            {
              "id": "1fd18501-bd93-4962-a126-90c38b43101b",
              "type": "basic.outputLabel",
              "data": {
                "name": "mem_addr",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1296,
                "y": 248
              }
            },
            {
              "id": "8dc07284-75bd-45d1-961f-488df3e01a69",
              "type": "basic.inputLabel",
              "data": {
                "name": "uart0_data",
                "range": "[7:0]",
                "pins": [
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 2240,
                "y": 296
              }
            },
            {
              "id": "957a5ad5-d7f3-4384-a36d-eaa811bd195e",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 1896,
                "y": 312
              }
            },
            {
              "id": "742564d4-d874-4369-827d-c5c0234ccb09",
              "type": "basic.inputLabel",
              "data": {
                "name": "mem_addr",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1344,
                "y": 368
              }
            },
            {
              "id": "1520db71-b9fe-4090-ab36-0185a5b94478",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 512,
                "y": 376
              }
            },
            {
              "id": "97d5ec80-291e-43ef-b46c-7bfa6f756718",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "rx",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true
              },
              "position": {
                "x": 1920,
                "y": 384
              }
            },
            {
              "id": "ea2dce21-595d-4d53-9636-2dd140f2561a",
              "type": "basic.inputLabel",
              "data": {
                "name": "code_addr",
                "range": "[12:0]",
                "pins": [
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1384,
                "y": 432
              }
            },
            {
              "id": "3b16280a-df1f-4164-9132-76c58bc2361a",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 2256,
                "y": 440
              }
            },
            {
              "id": "8f6962dd-ab19-4240-aba6-0a98c0fd275d",
              "type": "basic.inputLabel",
              "data": {
                "name": "mem_wr",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1432,
                "y": 488
              }
            },
            {
              "id": "5b0de6f5-8e47-410c-8e94-875f4db50ca2",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_valid",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true
              },
              "position": {
                "x": 2528,
                "y": 512
              }
            },
            {
              "id": "52e825cb-b36d-4ada-bf7c-7b38016a6dd2",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 192,
                "y": 528
              }
            },
            {
              "id": "46a9a4f7-3850-47dc-9b5f-2d0aa41abd32",
              "type": "basic.inputLabel",
              "data": {
                "name": "dout",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1472,
                "y": 560
              }
            },
            {
              "id": "87f549b6-2900-4978-b309-4d96edf282c6",
              "type": "basic.outputLabel",
              "data": {
                "name": "dout",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1656,
                "y": 576
              }
            },
            {
              "id": "99b6d782-02cb-419e-ab39-d5db975866e3",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_rd",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 2216,
                "y": 592
              }
            },
            {
              "id": "78a57741-2152-4d7d-94bb-d6fd212b9f9e",
              "type": "basic.outputLabel",
              "data": {
                "name": "mem_addr",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": -160,
                "y": 592
              }
            },
            {
              "id": "08ad146c-5487-4d17-8ab0-dad86f0dfec7",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "io_wr",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1360,
                "y": 608
              }
            },
            {
              "id": "66573385-013c-4e16-9f06-fe22b12c74fe",
              "type": "basic.inputLabel",
              "data": {
                "name": "do",
                "range": "[7:0]",
                "pins": [
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 2008,
                "y": 608
              }
            },
            {
              "id": "b17e0695-f30e-4194-8c43-57ca4c6918b1",
              "type": "basic.outputLabel",
              "data": {
                "name": "insn",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 432,
                "y": 616
              }
            },
            {
              "id": "0f93e723-2f5a-4c9e-9410-197decc6d74a",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "io_rd",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1496,
                "y": 648
              }
            },
            {
              "id": "11850e11-7e7e-4955-b968-f7377ea5ee38",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_valid",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true
              },
              "position": {
                "x": -192,
                "y": 656
              }
            },
            {
              "id": "87c974a0-ec7f-4ddb-8954-174c5e721312",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "ds_we",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1368,
                "y": 704
              }
            },
            {
              "id": "ceba3331-d094-4282-ab52-54b92a10915d",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 1680,
                "y": 704
              }
            },
            {
              "id": "028d32ef-469e-4887-b36e-8c26566fe03f",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "uart0_busy",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": -144,
                "y": 736
              }
            },
            {
              "id": "fd66c933-47f4-49d3-88b3-281e5ea0050d",
              "type": "basic.inputLabel",
              "data": {
                "name": "ds_delta",
                "range": "[1:0]",
                "pins": [
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1488,
                "y": 752
              }
            },
            {
              "id": "814984eb-cd10-489d-93fe-5b561c4d057a",
              "type": "basic.outputLabel",
              "data": {
                "name": "do",
                "range": "[7:0]",
                "pins": [
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1632,
                "y": 776
              }
            },
            {
              "id": "65b4a9f3-2698-491e-9b3f-694a2217e791",
              "type": "basic.outputLabel",
              "data": {
                "name": "uart0_data",
                "range": "[7:0]",
                "pins": [
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": -144,
                "y": 800
              }
            },
            {
              "id": "c2f4d468-870e-45b1-8ac5-a2301ba900fc",
              "type": "basic.inputLabel",
              "data": {
                "name": "ds_wd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1360,
                "y": 800
              }
            },
            {
              "id": "cbb8f981-a07c-4c6e-bd91-997bb3768cde",
              "type": "basic.outputLabel",
              "data": {
                "name": "ds_rd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 472,
                "y": 808
              }
            },
            {
              "id": "72931e85-4289-4b63-a89a-ca018503c005",
              "type": "basic.output",
              "data": {
                "name": "out",
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
                "x": 2520,
                "y": 824
              }
            },
            {
              "id": "2f77e415-c94d-4ab4-969f-af0facbf3300",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "io_wr",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1632,
                "y": 848
              }
            },
            {
              "id": "a8c84e3d-97b8-48fc-bc4a-1b706987b884",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "rs_we",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1480,
                "y": 848
              }
            },
            {
              "id": "d440902a-074c-4ab4-87b2-71874e5bd0d5",
              "type": "basic.inputLabel",
              "data": {
                "name": "rs_delta",
                "range": "[1:0]",
                "pins": [
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1344,
                "y": 888
              }
            },
            {
              "id": "f166bcd8-6b5a-4921-a6da-3b133f4b2bdd",
              "type": "basic.outputLabel",
              "data": {
                "name": "rs_rd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 480,
                "y": 896
              }
            },
            {
              "id": "9b605e13-e3f2-4256-9fd9-3ae270c38198",
              "type": "basic.outputLabel",
              "data": {
                "name": "mem_addr",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1632,
                "y": 912
              }
            },
            {
              "id": "86004853-f477-4011-a3ff-4b8712e5e344",
              "type": "basic.inputLabel",
              "data": {
                "name": "rs_wd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1312,
                "y": 1000
              }
            },
            {
              "id": "7a48b185-b1f8-4237-84b7-d152b81ea6d8",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 1664,
                "y": 1048
              }
            },
            {
              "id": "f0c4d6c4-8d41-4b96-b0b7-467b88e1724f",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 680,
                "y": 1112
              }
            },
            {
              "id": "a193cf63-7b4a-4073-9fe6-3685b25cce70",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": -144,
                "y": 1128
              }
            },
            {
              "id": "5f3aa05b-8713-4698-9679-8fb47a91b9df",
              "type": "basic.outputLabel",
              "data": {
                "name": "mem_addr",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1616,
                "y": 1136
              }
            },
            {
              "id": "7ae0edf8-a6a0-4cdb-bf05-530466c9d116",
              "type": "basic.outputLabel",
              "data": {
                "name": "code_addr",
                "range": "[12:0]",
                "pins": [
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": 1616,
                "y": 1208
              }
            },
            {
              "id": "03bcd0f6-4509-422e-9f9b-3f8ef4c83605",
              "type": "basic.inputLabel",
              "data": {
                "name": "insn",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 2432,
                "y": 1208
              }
            },
            {
              "id": "419aa58b-17ab-4dc7-beec-2dc11a4869d7",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "rs_we",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 704,
                "y": 1232
              }
            },
            {
              "id": "58837e34-e798-4a1a-bfea-2b0d89737615",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "ds_we",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": -152,
                "y": 1240
              }
            },
            {
              "id": "1e79cbcf-7be9-4eb5-9ed7-4cf40454f3f6",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "mem_wr",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1616,
                "y": 1264
              }
            },
            {
              "id": "dd4c5403-991a-411d-934f-2a4783270526",
              "type": "basic.inputLabel",
              "data": {
                "name": "rs_rd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1384,
                "y": 1272
              }
            },
            {
              "id": "516957eb-b055-420e-b3d2-f766d8a82d36",
              "type": "basic.inputLabel",
              "data": {
                "name": "ds_rd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 528,
                "y": 1280
              }
            },
            {
              "id": "ea1656f5-c516-4cf9-bd65-7e453b1cb83e",
              "type": "basic.outputLabel",
              "data": {
                "name": "rs_delta",
                "range": "[1:0]",
                "pins": [
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 672,
                "y": 1304
              }
            },
            {
              "id": "e84f3926-b7c3-4036-8718-f034b5e6e05c",
              "type": "basic.outputLabel",
              "data": {
                "name": "ds_delta",
                "range": "[1:0]",
                "pins": [
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": -184,
                "y": 1312
              }
            },
            {
              "id": "4495e023-df09-417a-aee1-5b91bd997399",
              "type": "basic.outputLabel",
              "data": {
                "name": "dout",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 1616,
                "y": 1320
              }
            },
            {
              "id": "7e3f5fc7-7a20-4b71-8f17-f1badde53066",
              "type": "basic.outputLabel",
              "data": {
                "name": "rs_wd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 672,
                "y": 1384
              }
            },
            {
              "id": "35ee3a55-dcda-48df-8cf2-fcb3d49f8252",
              "type": "basic.outputLabel",
              "data": {
                "name": "ds_wd",
                "range": "[15:0]",
                "pins": [
                  {
                    "index": "15",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "14",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "13",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "12",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "11",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "10",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "9",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "8",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "7",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "6",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "5",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "4",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "3",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "2",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "1",
                    "name": "",
                    "value": ""
                  },
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "blockColor": "fuchsia"
              },
              "position": {
                "x": -184,
                "y": 1392
              }
            },
            {
              "id": "aaf7ba00-0115-4d36-b84b-5460d800c56c",
              "type": "basic.constant",
              "data": {
                "name": "Prog",
                "value": "\"nuc.list\"",
                "local": false
              },
              "position": {
                "x": 2048,
                "y": 976
              }
            },
            {
              "id": "d4cff328-6501-4390-ba61-5083d137416f",
              "type": "3db97e88b7f9a2a65931f3638eaa612a255dccd7",
              "position": {
                "x": 336,
                "y": 528
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "a4cc137c-0356-47bc-b8bf-b20aef40722f",
              "type": "35f267d0df6ffcb7fc33753bc9df9cf083642cca",
              "position": {
                "x": 464,
                "y": 528
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
              "type": "basic.code",
              "data": {
                "code": "reg insn;\n//-- Definición de la tabla\n//-- Tabla de TAM elementos de M bits\nreg [15:0] tabla[0:4095];\n\n//-- Read the table\nalways @(posedge clk)\n  insn <= tabla[code_addr[11:0]];\n\n//-- Puerto escritura\nalways @(posedge clk)\n  if (mem_wr)\n      tabla[mem_addr[12:1]] <= d;\n\n//-- Init table from PROG parameter\ninitial begin\n  if (PROG) $readmemh(PROG, tabla);\nend\n",
                "params": [
                  {
                    "name": "PROG"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "mem_addr",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "code_addr",
                      "range": "[12:0]",
                      "size": 13
                    },
                    {
                      "name": "mem_wr"
                    },
                    {
                      "name": "d",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "insn",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ]
                }
              },
              "position": {
                "x": 1864,
                "y": 1096
              },
              "size": {
                "width": 464,
                "height": 280
              }
            },
            {
              "id": "8827b88d-fb24-459a-9d64-5ef9537d7cf2",
              "type": "basic.code",
              "data": {
                "code": "assign io_din =\n    (io_addr_[12] ? {8'd0, uart0_data}                                  : 16'd0) |\n    (io_addr_[13] ? {11'd0, 1'b1, 1'b1, 1'b1, uart0_valid, !uart0_busy} : 16'd0);\n    ",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "io_addr_",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "uart0_valid"
                    },
                    {
                      "name": "uart0_busy"
                    },
                    {
                      "name": "uart0_data",
                      "range": "[7:0]",
                      "size": 8
                    }
                  ],
                  "out": [
                    {
                      "name": "io_din",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ]
                }
              },
              "position": {
                "x": 56,
                "y": 672
              },
              "size": {
                "width": 368,
                "height": 152
              }
            },
            {
              "id": "c2e52669-8b7a-4455-afd4-738b7f8f84b6",
              "type": "basic.code",
              "data": {
                "code": "wire w4 = io_wr & io_addr_[2];\nreg port;\n\n //-- Puerto de salida\n  always @(posedge clk) \n    if (w4)\n      port <= dout[4:0];\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "dout",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "io_wr"
                    },
                    {
                      "name": "io_addr_",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "port",
                      "range": "[4:0]",
                      "size": 5
                    }
                  ]
                }
              },
              "position": {
                "x": 1840,
                "y": 776
              },
              "size": {
                "width": 392,
                "height": 160
              }
            },
            {
              "id": "84c069e2-a508-499a-81fd-b7782a81c954",
              "type": "basic.code",
              "data": {
                "code": "assign uart0_wr = io_wr & io_addr[12];\n  assign uart0_rd = io_rd & io_addr[12];",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "io_wr"
                    },
                    {
                      "name": "io_rd"
                    },
                    {
                      "name": "io_addr",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "uart0_rd"
                    },
                    {
                      "name": "uart0_wr"
                    }
                  ]
                }
              },
              "position": {
                "x": 1456,
                "y": 176
              },
              "size": {
                "width": 280,
                "height": 96
              }
            },
            {
              "id": "6506a0fc-150f-41c7-bef9-e856941c7d9e",
              "type": "26f57ab819923cfb72331d71a53aae8ab0714455",
              "position": {
                "x": 1824,
                "y": 576
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "6f05b578-94c4-44d8-8b38-38287572b158",
              "type": "b9ce1495492d9bb52158ff7ab53777abfad9c97d",
              "position": {
                "x": 2080,
                "y": 344
              },
              "size": {
                "width": 96,
                "height": 96
              }
            },
            {
              "id": "07603df3-441c-4ac9-813e-285b38fe0038",
              "type": "b959c256104d1064a5ef7b38632ffb6eed3b396f",
              "position": {
                "x": 2392,
                "y": 496
              },
              "size": {
                "width": 96,
                "height": 96
              }
            },
            {
              "id": "75b01bf7-5a4d-47ff-bb1d-f1c0cc17c657",
              "type": "basic.code",
              "data": {
                "code": "localparam WIDTH = 16;\nlocalparam DEPTH = 15;\nlocalparam BITS = (WIDTH * DEPTH) - 1;\n\nwire move = delta[0];\n\nreg [15:0] head;\nreg [BITS:0] tail;\nwire [15:0] headN;\nwire [BITS:0] tailN;\n\nassign headN = we ? wd : tail[15:0];\nassign tailN = delta[1] ? {16'h55aa, tail[BITS:16]} : {tail[BITS-16:0], head};\n\n  always @(posedge clk) begin\n    if (we | move)\n      head <= headN;\n    if (move)\n      tail <= tailN;\n  end\n\n  assign rd = head;\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "we"
                    },
                    {
                      "name": "delta",
                      "range": "[1:0]",
                      "size": 2
                    },
                    {
                      "name": "wd",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "rd",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ]
                }
              },
              "position": {
                "x": 0,
                "y": 1152
              },
              "size": {
                "width": 448,
                "height": 312
              }
            },
            {
              "id": "d0f9b2f8-f779-4aec-93cd-23f26245b359",
              "type": "basic.code",
              "data": {
                "code": "localparam WIDTH = 16;\nlocalparam DEPTH = 17;\nlocalparam BITS = (WIDTH * DEPTH) - 1;\n\nwire move = delta[0];\n\nreg [15:0] head;\nreg [BITS:0] tail;\nwire [15:0] headN;\nwire [BITS:0] tailN;\n\nassign headN = we ? wd : tail[15:0];\nassign tailN = delta[1] ? {16'h55aa, tail[BITS:16]} : {tail[BITS-16:0], head};\n\n  always @(posedge clk) begin\n    if (we | move)\n      head <= headN;\n    if (move)\n      tail <= tailN;\n  end\n\n  assign rd = head;\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "we"
                    },
                    {
                      "name": "delta",
                      "range": "[1:0]",
                      "size": 2
                    },
                    {
                      "name": "wd",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "rd",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ]
                }
              },
              "position": {
                "x": 856,
                "y": 1144
              },
              "size": {
                "width": 448,
                "height": 312
              }
            },
            {
              "id": "5e7ca03a-eb7f-4a9b-86e9-89b16c49ea5f",
              "type": "basic.info",
              "data": {
                "info": "** Pila de datos **\n\n15 x 16 bits ",
                "readonly": true
              },
              "position": {
                "x": 160,
                "y": 1072
              },
              "size": {
                "width": 184,
                "height": 80
              }
            },
            {
              "id": "ff90bf2f-e04e-4af8-b98b-8bf6eb971264",
              "type": "basic.info",
              "data": {
                "info": "** Pila de Retorno **",
                "readonly": true
              },
              "position": {
                "x": 1000,
                "y": 1088
              },
              "size": {
                "width": 176,
                "height": 40
              }
            },
            {
              "id": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
              "type": "basic.code",
              "data": {
                "code": "localparam WIDTH=16;\n\n  reg [3:0] dsp = 0, dspN = 0;          // data stack pointer\n  reg [WIDTH-1:0] st0 = 0, st0N;   // top of data stack\n  reg dstkW;                    // data stack write\n\n  reg [12:0] pc = 0;\n  reg [12:0] pcN = 0;           // program counter\n  wire [12:0] pc_plus_1 = pc + 13'd1;\n  reg rstkW;                    // return stack write\n  wire [WIDTH-1:0] rstkD;      // return stack write value\n  reg reboot = 1;\n\n  assign mem_addr = st0[15:0];\n  assign code_addr = pcN;\n\n  // The D and R stacks\n  wire [WIDTH-1:0] st1, rst0;\n  reg [1:0] dspI, rspI;\n\n  //-- Mi conexion a la pila\n  assign ds_we = dstkW;\n  assign ds_delta = dspI;\n  assign ds_wd = st0;\n  assign st1 = ds_rd;\n  \n  assign rs_we = rstkW;\n  assign rs_delta = rspI;\n  assign rs_wd = rstkD;\n  assign rst0 = rs_rd;\n\n  wire [16:0] minus = {1'b1, ~st0} + st1 + 1;\n  wire signedless = st0[15] ^ st1[15] ? st1[15] : minus[16];\n\n  always @*\n  begin\n    // Compute the new value of st0\n    casez ({pc[12], insn[15:8]})\n      9'b1_???_?????: st0N = insn;                    // literal\n      9'b0_1??_?????: st0N = { {(WIDTH - 15){1'b0}}, insn[14:0] };    // literal\n      9'b0_000_?????: st0N = st0;                     // jump\n      9'b0_010_?????: st0N = st0;                     // call\n      9'b0_001_?????: st0N = st1;                     // conditional jump\n      9'b0_011_?0000: st0N = st0;                     // ALU operations...\n      9'b0_011_?0001: st0N = st1;\n      9'b0_011_?0010: st0N = st0 + st1;\n      9'b0_011_?0011: st0N = st0 & st1;\n      9'b0_011_?0100: st0N = st0 | st1;\n      9'b0_011_?0101: st0N = st0 ^ st1;\n      9'b0_011_?0110: st0N = ~st0;\n\n      9'b0_011_?0111: st0N = {WIDTH{(minus == 0)}};                //  =\n      9'b0_011_?1000: st0N = {WIDTH{(signedless)}};                //  <\n\n      9'b0_011_?1001: st0N = {st0[WIDTH - 1], st0[WIDTH - 1:1]};\n      9'b0_011_?1010: st0N = {st0[WIDTH - 2:0], 1'b0};\n      9'b0_011_?1011: st0N = rst0;\n      9'b0_011_?1100: st0N = minus[15:0];\n      9'b0_011_?1101: st0N = io_din;\n      9'b0_011_?1110: st0N = {{(WIDTH - 4){1'b0}}, dsp};\n      9'b0_011_?1111: st0N = {WIDTH{(minus[16])}};                 // u<\n      default: st0N = {WIDTH{1'bx}};\n    endcase\n  end\n\n  wire func_T_N =   (insn[6:4] == 1);\n  wire func_T_R =   (insn[6:4] == 2);\n  wire func_write = (insn[6:4] == 3);\n  wire func_iow =   (insn[6:4] == 4);\n  wire func_ior =   (insn[6:4] == 5);\n\n  wire is_alu = !pc[12] & (insn[15:13] == 3'b011);\n  assign mem_wr = !reboot & is_alu & func_write;\n  assign dout = st1;\n  assign io_wr = !reboot & is_alu & func_iow;\n  assign io_rd = !reboot & is_alu & func_ior;\n\n  assign rstkD = (insn[13] == 1'b0) ? {{(WIDTH - 14){1'b0}}, pc_plus_1, 1'b0} : st0;\n\n  always @*\n  begin\n    casez ({pc[12], insn[15:13]})\n    4'b1_???,\n    4'b0_1??:   {dstkW, dspI} = {1'b1,      2'b01};\n    4'b0_001:   {dstkW, dspI} = {1'b0,      2'b11};\n    4'b0_011:   {dstkW, dspI} = {func_T_N,  {insn[1:0]}};\n    default:    {dstkW, dspI} = {1'b0,      2'b00};\n    endcase\n    dspN = dsp + {dspI[1], dspI[1], dspI};\n\n    casez ({pc[12], insn[15:13]})\n    4'b1_???:   {rstkW, rspI} = {1'b0,      2'b11};\n    4'b0_010:   {rstkW, rspI} = {1'b1,      2'b01};\n    4'b0_011:   {rstkW, rspI} = {func_T_R,  insn[3:2]};\n    default:    {rstkW, rspI} = {1'b0,      2'b00};\n    endcase\n\n    casez ({reboot, pc[12], insn[15:13], insn[7], |st0})\n    7'b1_0_???_?_?:   pcN = 0;\n    7'b0_0_000_?_?,\n    7'b0_0_010_?_?,\n    7'b0_0_001_?_0:   pcN = insn[12:0];\n    7'b0_1_???_?_?,\n    7'b0_0_011_1_?:   pcN = rst0[13:1];\n    default:          pcN = pc_plus_1;\n    endcase\n  end\n\n  always @(posedge clk)\n  begin\n    if (!resetq) begin\n      reboot <= 1'b1;\n      { pc, dsp, st0} <= 0;\n    end else begin \n      reboot <= 0; \n      { pc, dsp, st0} <= { pcN, dspN, st0N };\n    end\n  end\n\n  \n\n\n\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "resetq"
                    },
                    {
                      "name": "insn",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "io_din",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "ds_rd",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "rs_rd",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "mem_addr",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "code_addr",
                      "range": "[12:0]",
                      "size": 13
                    },
                    {
                      "name": "mem_wr"
                    },
                    {
                      "name": "dout",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "io_wr"
                    },
                    {
                      "name": "io_rd"
                    },
                    {
                      "name": "ds_we"
                    },
                    {
                      "name": "ds_delta",
                      "range": "[1:0]",
                      "size": 2
                    },
                    {
                      "name": "ds_wd",
                      "range": "[15:0]",
                      "size": 16
                    },
                    {
                      "name": "rs_we"
                    },
                    {
                      "name": "rs_delta",
                      "range": "[1:0]",
                      "size": 2
                    },
                    {
                      "name": "rs_wd",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ]
                }
              },
              "position": {
                "x": 672,
                "y": 440
              },
              "size": {
                "width": 568,
                "height": 552
              }
            },
            {
              "id": "e5db79f0-b27a-4ddb-ae1b-5f42f1b2e1c1",
              "type": "c6459cf10c1547cd019a1270349def563247dd01",
              "position": {
                "x": 2304,
                "y": 128
              },
              "size": {
                "width": 96,
                "height": 96
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
                "port": "insn",
                "size": 16
              },
              "target": {
                "block": "03bcd0f6-4509-422e-9f9b-3f8ef4c83605",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "5f3aa05b-8713-4698-9679-8fb47a91b9df",
                "port": "outlabel"
              },
              "target": {
                "block": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
                "port": "mem_addr",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "7ae0edf8-a6a0-4cdb-bf05-530466c9d116",
                "port": "outlabel"
              },
              "target": {
                "block": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
                "port": "code_addr",
                "size": 13
              },
              "vertices": [],
              "size": 13
            },
            {
              "source": {
                "block": "1e79cbcf-7be9-4eb5-9ed7-4cf40454f3f6",
                "port": "outlabel"
              },
              "target": {
                "block": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
                "port": "mem_wr"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "4495e023-df09-417a-aee1-5b91bd997399",
                "port": "outlabel"
              },
              "target": {
                "block": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
                "port": "d",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "78a57741-2152-4d7d-94bb-d6fd212b9f9e",
                "port": "outlabel"
              },
              "target": {
                "block": "8827b88d-fb24-459a-9d64-5ef9537d7cf2",
                "port": "io_addr_",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "11850e11-7e7e-4955-b968-f7377ea5ee38",
                "port": "outlabel"
              },
              "target": {
                "block": "8827b88d-fb24-459a-9d64-5ef9537d7cf2",
                "port": "uart0_valid"
              },
              "vertices": [
                {
                  "x": -80,
                  "y": 696
                }
              ]
            },
            {
              "source": {
                "block": "028d32ef-469e-4887-b36e-8c26566fe03f",
                "port": "outlabel"
              },
              "target": {
                "block": "8827b88d-fb24-459a-9d64-5ef9537d7cf2",
                "port": "uart0_busy"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "65b4a9f3-2698-491e-9b3f-694a2217e791",
                "port": "outlabel"
              },
              "target": {
                "block": "8827b88d-fb24-459a-9d64-5ef9537d7cf2",
                "port": "uart0_data",
                "size": 8
              },
              "vertices": [],
              "size": 8
            },
            {
              "source": {
                "block": "814984eb-cd10-489d-93fe-5b561c4d057a",
                "port": "outlabel"
              },
              "target": {
                "block": "c2e52669-8b7a-4455-afd4-738b7f8f84b6",
                "port": "dout",
                "size": 8
              },
              "vertices": [],
              "size": 8
            },
            {
              "source": {
                "block": "9b605e13-e3f2-4256-9fd9-3ae270c38198",
                "port": "outlabel"
              },
              "target": {
                "block": "c2e52669-8b7a-4455-afd4-738b7f8f84b6",
                "port": "io_addr_",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "2f77e415-c94d-4ab4-969f-af0facbf3300",
                "port": "outlabel"
              },
              "target": {
                "block": "c2e52669-8b7a-4455-afd4-738b7f8f84b6",
                "port": "io_wr"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "84c069e2-a508-499a-81fd-b7782a81c954",
                "port": "uart0_wr"
              },
              "target": {
                "block": "36c09412-6015-4849-85bc-27e028547741",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "1fd18501-bd93-4962-a126-90c38b43101b",
                "port": "outlabel"
              },
              "target": {
                "block": "84c069e2-a508-499a-81fd-b7782a81c954",
                "port": "io_addr",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "34fd1cdb-fc0c-466b-82f2-f93fc1841f3d",
                "port": "outlabel"
              },
              "target": {
                "block": "84c069e2-a508-499a-81fd-b7782a81c954",
                "port": "io_rd"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "6506a0fc-150f-41c7-bef9-e856941c7d9e",
                "port": "c675bded-7009-4371-b928-dadba3620245",
                "size": 8
              },
              "target": {
                "block": "66573385-013c-4e16-9f06-fe22b12c74fe",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 8
            },
            {
              "source": {
                "block": "87f549b6-2900-4978-b309-4d96edf282c6",
                "port": "outlabel"
              },
              "target": {
                "block": "6506a0fc-150f-41c7-bef9-e856941c7d9e",
                "port": "65464f98-4fb4-4295-ab73-153196ce1d0d",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "6f05b578-94c4-44d8-8b38-38287572b158",
                "port": "b82422cd-6ac3-4b32-a8b8-3aff2a066775",
                "size": 8
              },
              "target": {
                "block": "8dc07284-75bd-45d1-961f-488df3e01a69",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 8
            },
            {
              "source": {
                "block": "07603df3-441c-4ac9-813e-285b38fe0038",
                "port": "1cb167a4-9e2a-416b-803e-da7b6151eaa5"
              },
              "target": {
                "block": "5b0de6f5-8e47-410c-8e94-875f4db50ca2",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "99b6d782-02cb-419e-ab39-d5db975866e3",
                "port": "outlabel"
              },
              "target": {
                "block": "07603df3-441c-4ac9-813e-285b38fe0038",
                "port": "86eb8c81-17fc-4371-bd21-51f429191f3c"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "58837e34-e798-4a1a-bfea-2b0d89737615",
                "port": "outlabel"
              },
              "target": {
                "block": "75b01bf7-5a4d-47ff-bb1d-f1c0cc17c657",
                "port": "we"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e84f3926-b7c3-4036-8718-f034b5e6e05c",
                "port": "outlabel"
              },
              "target": {
                "block": "75b01bf7-5a4d-47ff-bb1d-f1c0cc17c657",
                "port": "delta",
                "size": 2
              },
              "vertices": [],
              "size": 2
            },
            {
              "source": {
                "block": "35ee3a55-dcda-48df-8cf2-fcb3d49f8252",
                "port": "outlabel"
              },
              "target": {
                "block": "75b01bf7-5a4d-47ff-bb1d-f1c0cc17c657",
                "port": "wd",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "75b01bf7-5a4d-47ff-bb1d-f1c0cc17c657",
                "port": "rd",
                "size": 16
              },
              "target": {
                "block": "516957eb-b055-420e-b3d2-f766d8a82d36",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "d0f9b2f8-f779-4aec-93cd-23f26245b359",
                "port": "rd",
                "size": 16
              },
              "target": {
                "block": "dd4c5403-991a-411d-934f-2a4783270526",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "419aa58b-17ab-4dc7-beec-2dc11a4869d7",
                "port": "outlabel"
              },
              "target": {
                "block": "d0f9b2f8-f779-4aec-93cd-23f26245b359",
                "port": "we"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "ea1656f5-c516-4cf9-bd65-7e453b1cb83e",
                "port": "outlabel"
              },
              "target": {
                "block": "d0f9b2f8-f779-4aec-93cd-23f26245b359",
                "port": "delta",
                "size": 2
              },
              "vertices": [],
              "size": 2
            },
            {
              "source": {
                "block": "7e3f5fc7-7a20-4b71-8f17-f1badde53066",
                "port": "outlabel"
              },
              "target": {
                "block": "d0f9b2f8-f779-4aec-93cd-23f26245b359",
                "port": "wd",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "io_wr"
              },
              "target": {
                "block": "08ad146c-5487-4d17-8ab0-dad86f0dfec7",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "io_rd"
              },
              "target": {
                "block": "0f93e723-2f5a-4c9e-9410-197decc6d74a",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "mem_addr",
                "size": 16
              },
              "target": {
                "block": "742564d4-d874-4369-827d-c5c0234ccb09",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "code_addr",
                "size": 13
              },
              "target": {
                "block": "ea2dce21-595d-4d53-9636-2dd140f2561a",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 13
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "mem_wr"
              },
              "target": {
                "block": "8f6962dd-ab19-4240-aba6-0a98c0fd275d",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "dout",
                "size": 16
              },
              "target": {
                "block": "46a9a4f7-3850-47dc-9b5f-2d0aa41abd32",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "ds_we"
              },
              "target": {
                "block": "87c974a0-ec7f-4ddb-8954-174c5e721312",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "ds_delta",
                "size": 2
              },
              "target": {
                "block": "fd66c933-47f4-49d3-88b3-281e5ea0050d",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 2
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "ds_wd",
                "size": 16
              },
              "target": {
                "block": "c2f4d468-870e-45b1-8ac5-a2301ba900fc",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "rs_we"
              },
              "target": {
                "block": "a8c84e3d-97b8-48fc-bc4a-1b706987b884",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "rs_delta",
                "size": 2
              },
              "target": {
                "block": "d440902a-074c-4ab4-87b2-71874e5bd0d5",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 2
            },
            {
              "source": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "rs_wd",
                "size": 16
              },
              "target": {
                "block": "86004853-f477-4011-a3ff-4b8712e5e344",
                "port": "inlabel"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "b17e0695-f30e-4194-8c43-57ca4c6918b1",
                "port": "outlabel"
              },
              "target": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "insn",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "cbb8f981-a07c-4c6e-bd91-997bb3768cde",
                "port": "outlabel"
              },
              "target": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "ds_rd",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "f166bcd8-6b5a-4921-a6da-3b133f4b2bdd",
                "port": "outlabel"
              },
              "target": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "rs_rd",
                "size": 16
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "e1a76828-11ec-4932-95af-978420a102db",
                "port": "outlabel"
              },
              "target": {
                "block": "84c069e2-a508-499a-81fd-b7782a81c954",
                "port": "io_wr"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "84c069e2-a508-499a-81fd-b7782a81c954",
                "port": "uart0_rd"
              },
              "target": {
                "block": "decb0eac-dce2-4e32-b7e5-430f5c311b79",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e5db79f0-b27a-4ddb-ae1b-5f42f1b2e1c1",
                "port": "75d4695e-f445-4762-9ae9-c9bf0e51974f"
              },
              "target": {
                "block": "76826995-bc5a-4a0d-a510-b3f5fa5ba1ef",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "cc1c336f-e0ab-4e27-81f6-ac7b2dc3efd5",
                "port": "outlabel"
              },
              "target": {
                "block": "e5db79f0-b27a-4ddb-ae1b-5f42f1b2e1c1",
                "port": "27183891-b385-412b-bc55-21df1dd0280e",
                "size": 8
              },
              "vertices": [
                {
                  "x": 2240,
                  "y": 160
                }
              ],
              "size": 8
            },
            {
              "source": {
                "block": "2b458f43-dcde-491e-bcee-a074542e4ecf",
                "port": "outlabel"
              },
              "target": {
                "block": "e5db79f0-b27a-4ddb-ae1b-5f42f1b2e1c1",
                "port": "6bb28a95-e6e4-4044-9c22-c4404693b6b1"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "260f3e2d-cae1-4c7b-9a94-7c703a4214fc",
                "port": "out"
              },
              "target": {
                "block": "9aee792a-413f-48b7-bd5d-65a3a353e408",
                "port": "inlabel"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "1520db71-b9fe-4090-ab36-0185a5b94478",
                "port": "outlabel"
              },
              "target": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "52e825cb-b36d-4ada-bf7c-7b38016a6dd2",
                "port": "outlabel"
              },
              "target": {
                "block": "d4cff328-6501-4390-ba61-5083d137416f",
                "port": "6c1206ed-2bec-4a5e-94d0-1d6aaa6011ab"
              }
            },
            {
              "source": {
                "block": "f0c4d6c4-8d41-4b96-b0b7-467b88e1724f",
                "port": "outlabel"
              },
              "target": {
                "block": "d0f9b2f8-f779-4aec-93cd-23f26245b359",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "a193cf63-7b4a-4073-9fe6-3685b25cce70",
                "port": "outlabel"
              },
              "target": {
                "block": "75b01bf7-5a4d-47ff-bb1d-f1c0cc17c657",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "7a48b185-b1f8-4237-84b7-d152b81ea6d8",
                "port": "outlabel"
              },
              "target": {
                "block": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "ceba3331-d094-4282-ab52-54b92a10915d",
                "port": "outlabel"
              },
              "target": {
                "block": "c2e52669-8b7a-4455-afd4-738b7f8f84b6",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "957a5ad5-d7f3-4384-a36d-eaa811bd195e",
                "port": "outlabel"
              },
              "target": {
                "block": "6f05b578-94c4-44d8-8b38-38287572b158",
                "port": "9b46173d-7429-4d90-8701-a2eae9f88c53"
              }
            },
            {
              "source": {
                "block": "3b16280a-df1f-4164-9132-76c58bc2361a",
                "port": "outlabel"
              },
              "target": {
                "block": "07603df3-441c-4ac9-813e-285b38fe0038",
                "port": "9f09a4af-8f7a-45c3-af7b-293a244e76d9"
              }
            },
            {
              "source": {
                "block": "0f7aee1e-a902-4f01-8394-d64d85f1e2b5",
                "port": "outlabel"
              },
              "target": {
                "block": "e5db79f0-b27a-4ddb-ae1b-5f42f1b2e1c1",
                "port": "4c296e24-7312-407a-8fb0-f3a6d4feb3ab"
              }
            },
            {
              "source": {
                "block": "c561caf2-9e7f-4754-bf15-632fa9fbaa61",
                "port": "out"
              },
              "target": {
                "block": "5f3bc26e-80a8-429b-bd7a-4091a8dbc93b",
                "port": "inlabel"
              }
            },
            {
              "source": {
                "block": "97d5ec80-291e-43ef-b46c-7bfa6f756718",
                "port": "outlabel"
              },
              "target": {
                "block": "6f05b578-94c4-44d8-8b38-38287572b158",
                "port": "2f6a3bb1-2010-4f69-a978-717528dc5160"
              }
            },
            {
              "source": {
                "block": "d4cff328-6501-4390-ba61-5083d137416f",
                "port": "dde18e55-7d08-438f-a248-5f1d0c050689"
              },
              "target": {
                "block": "a4cc137c-0356-47bc-b8bf-b20aef40722f",
                "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "aaf7ba00-0115-4d36-b84b-5460d800c56c",
                "port": "constant-out"
              },
              "target": {
                "block": "8f1839c0-2b6e-412b-9917-4c86ee1d277b",
                "port": "PROG"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "c2e52669-8b7a-4455-afd4-738b7f8f84b6",
                "port": "port"
              },
              "target": {
                "block": "72931e85-4289-4b63-a89a-ca018503c005",
                "port": "in"
              },
              "vertices": [],
              "size": 5
            },
            {
              "source": {
                "block": "6f05b578-94c4-44d8-8b38-38287572b158",
                "port": "d7ebc6ce-2cde-4e33-8c9d-b439fd2cb3e0"
              },
              "target": {
                "block": "07603df3-441c-4ac9-813e-285b38fe0038",
                "port": "3ae2d46d-7981-497a-899f-b60bfae0f43e"
              },
              "vertices": [
                {
                  "x": 2240,
                  "y": 512
                }
              ]
            },
            {
              "source": {
                "block": "a4cc137c-0356-47bc-b8bf-b20aef40722f",
                "port": "664caf9e-5f40-4df4-800a-b626af702e62"
              },
              "target": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "resetq"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "8827b88d-fb24-459a-9d64-5ef9537d7cf2",
                "port": "io_din"
              },
              "target": {
                "block": "e51e6bb7-75f1-4794-9756-b8adacdfb049",
                "port": "io_din"
              },
              "vertices": [],
              "size": 16
            },
            {
              "source": {
                "block": "e5db79f0-b27a-4ddb-ae1b-5f42f1b2e1c1",
                "port": "09701eaa-8d79-487f-b003-267e04095bb1"
              },
              "target": {
                "block": "8d1dc17a-f5c2-4a52-bebd-48a895d6ac51",
                "port": "in"
              },
              "vertices": []
            }
          ]
        }
      }
    },
    "3db97e88b7f9a2a65931f3638eaa612a255dccd7": {
      "package": {
        "name": "Init-tic",
        "version": "0.1",
        "description": "Emitir un tic inicial al arrancar, y nunca más. Se esperan 32 tics antes de emitir el tic de inicialización",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%220%200%20223.26234%20181.35395%22%20width=%22223.262%22%20height=%22181.354%22%3E%3Ctext%20y=%22177.149%22%20x=%22170.346%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%22143.805%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%20stroke-width=%222.667%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%22177.149%22%20x=%22170.346%22%20font-weight=%22700%22%20font-size=%2282.175%22%3E0%3C/tspan%3E%3C/text%3E%3Cg%20transform=%22matrix(6.1007%200%200%206.1007%20-523.066%20-359.649)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "6c1206ed-2bec-4a5e-94d0-1d6aaa6011ab",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": -40,
                "y": -160
              }
            },
            {
              "id": "ca5b2759-5915-4d42-86fc-f89d40a09477",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true,
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 120,
                "y": -160
              }
            },
            {
              "id": "3dc6cc54-3adc-4c45-9681-4282df85333c",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 712,
                "y": 8
              }
            },
            {
              "id": "d8228536-d8cc-41e5-b66a-b9b9206f5a29",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": -32,
                "y": 32
              }
            },
            {
              "id": "04add128-7534-436b-a480-1c0946efabe7",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "yellow",
                "name": "clk"
              },
              "position": {
                "x": 288,
                "y": 32
              }
            },
            {
              "id": "dde18e55-7d08-438f-a248-5f1d0c050689",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 1056,
                "y": 72
              }
            },
            {
              "id": "a0446890-6e97-45f4-84a6-7ff8a183b4df",
              "type": "basic.constant",
              "data": {
                "name": "",
                "value": "1",
                "local": true
              },
              "position": {
                "x": 144,
                "y": 8
              }
            },
            {
              "id": "85b873ff-5ed1-492a-9d0c-1dc7f02ad574",
              "type": "b959c256104d1064a5ef7b38632ffb6eed3b396f",
              "position": {
                "x": 144,
                "y": 104
              },
              "size": {
                "width": 96,
                "height": 96
              }
            },
            {
              "id": "611e258f-ea59-4c84-a8b4-e9fa736dde3a",
              "type": "21cfcc19a4ad14c5fb5e8cfebd018ec356fe7542",
              "position": {
                "x": -40,
                "y": 120
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "93749395-177e-40dd-9a6a-8fc725714049",
              "type": "8e2728307baccbf26c01cdb87bcfba8ca64a435c",
              "position": {
                "x": 864,
                "y": 72
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "5055f643-9bac-45af-bce4-0f6c55e89d32",
              "type": "2814a1ad2ca9db581a01ec880d388f1ba9523c1b",
              "position": {
                "x": 616,
                "y": 104
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "4c408127-e45d-4199-9241-0d41741d0200",
              "type": "c89ab7c8b644f8ff5e6b7d27a657f7e3a247b09b",
              "position": {
                "x": 432,
                "y": 104
              },
              "size": {
                "width": 96,
                "height": 64
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "6c1206ed-2bec-4a5e-94d0-1d6aaa6011ab",
                "port": "out"
              },
              "target": {
                "block": "ca5b2759-5915-4d42-86fc-f89d40a09477",
                "port": "inlabel"
              }
            },
            {
              "source": {
                "block": "3dc6cc54-3adc-4c45-9681-4282df85333c",
                "port": "outlabel"
              },
              "target": {
                "block": "93749395-177e-40dd-9a6a-8fc725714049",
                "port": "4196184b-4a60-493b-bcc6-c95958483683"
              }
            },
            {
              "source": {
                "block": "d8228536-d8cc-41e5-b66a-b9b9206f5a29",
                "port": "outlabel"
              },
              "target": {
                "block": "85b873ff-5ed1-492a-9d0c-1dc7f02ad574",
                "port": "9f09a4af-8f7a-45c3-af7b-293a244e76d9"
              }
            },
            {
              "source": {
                "block": "04add128-7534-436b-a480-1c0946efabe7",
                "port": "outlabel"
              },
              "target": {
                "block": "4c408127-e45d-4199-9241-0d41741d0200",
                "port": "c90da543-4b9c-4f4c-a5fa-7e1166ee1dd3"
              }
            },
            {
              "source": {
                "block": "85b873ff-5ed1-492a-9d0c-1dc7f02ad574",
                "port": "1cb167a4-9e2a-416b-803e-da7b6151eaa5"
              },
              "target": {
                "block": "4c408127-e45d-4199-9241-0d41741d0200",
                "port": "36b50629-7161-42ec-9310-b9de76429b43"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "a0446890-6e97-45f4-84a6-7ff8a183b4df",
                "port": "constant-out"
              },
              "target": {
                "block": "85b873ff-5ed1-492a-9d0c-1dc7f02ad574",
                "port": "bf12a800-db30-4289-a7c5-8c08438f9a39"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "5055f643-9bac-45af-bce4-0f6c55e89d32",
                "port": "ff382b55-361b-4e5c-aba9-8d018d8320a3"
              },
              "target": {
                "block": "93749395-177e-40dd-9a6a-8fc725714049",
                "port": "b6426b43-dcda-418d-b6d3-4764b5bc0b25"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "5055f643-9bac-45af-bce4-0f6c55e89d32",
                "port": "ff382b55-361b-4e5c-aba9-8d018d8320a3"
              },
              "target": {
                "block": "85b873ff-5ed1-492a-9d0c-1dc7f02ad574",
                "port": "86eb8c81-17fc-4371-bd21-51f429191f3c"
              },
              "vertices": [
                {
                  "x": 768,
                  "y": 256
                }
              ]
            },
            {
              "source": {
                "block": "4c408127-e45d-4199-9241-0d41741d0200",
                "port": "7db964fd-e6ba-4f63-ba60-704490452fd6"
              },
              "target": {
                "block": "5055f643-9bac-45af-bce4-0f6c55e89d32",
                "port": "d3394625-6e06-440a-a47d-c2a06daedcdb"
              },
              "vertices": [],
              "size": 6
            },
            {
              "source": {
                "block": "611e258f-ea59-4c84-a8b4-e9fa736dde3a",
                "port": "3d584b0a-29eb-47af-8c43-c0822282ef05"
              },
              "target": {
                "block": "85b873ff-5ed1-492a-9d0c-1dc7f02ad574",
                "port": "3ae2d46d-7981-497a-899f-b60bfae0f43e"
              }
            },
            {
              "source": {
                "block": "93749395-177e-40dd-9a6a-8fc725714049",
                "port": "1d2e403f-0fa6-41fd-83a9-4f309eadd855"
              },
              "target": {
                "block": "dde18e55-7d08-438f-a248-5f1d0c050689",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "b959c256104d1064a5ef7b38632ffb6eed3b396f": {
      "package": {
        "name": "Biestable-Set-Reset",
        "version": "0.1",
        "description": "Biestable con entradas de Set y Reset síncronas, para poner y quitar notaficaciones de eventos",
        "author": "Juan Gonzalez-Gomez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%220%200%20234.62951%20290.44458%22%20id=%22svg30%22%20width=%22234.63%22%20height=%22290.445%22%3E%3Cstyle%20id=%22style2%22%3E.st0%7Bdisplay:none%7D.st1%7Bfill:none;stroke:#303030;stroke-width:.7;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10%7D.st2%7Bfill:#303030%7D%3C/style%3E%3Cg%20id=%22layer1%22%20transform=%22translate(3.47%203.198)%22%3E%3Cpath%20class=%22st1%22%20d=%22M21.358%20145.947a63.75%2063.75%200%200%200%201.152%2011.049%22%20id=%22path9%22%20fill=%22none%22%20stroke=%22#303030%22%20stroke-width=%226.776%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22%20stroke-miterlimit=%2210%22/%3E%3Cpath%20class=%22st1%22%20d=%22M48.702%2092.116a64.784%2064.784%200%200%200-12.559%2011.68%2064.99%2064.99%200%200%200-12.69%2024.809%22%20id=%22path11%22%20fill=%22none%22%20stroke=%22#303030%22%20stroke-width=%226.776%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22%20stroke-miterlimit=%2210%22/%3E%3Cpath%20id=%22line17%22%20class=%22st1%22%20fill=%22none%22%20stroke=%22#303030%22%20stroke-width=%226.776%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22%20stroke-miterlimit=%2210%22%20d=%22M184.865%20207.591L41.298%20262.802%22/%3E%3Cpath%20id=%22path21-3%22%20d=%22M185.448%20175.07l.37.154c2.52.831%204.718%202.386%206.634%204.249%202.02%202.322%203.694%204.777%204.423%208.713%201.496%208.074-3.286%2016.05-10.95%2018.997l-1.06.408L41.298%20262.8l-.733.283c-8.003%203.077-17.551.461-21.82-6.975-3.3-5.748-2.736-12.198.418-21.613%203.155-9.414%202.86-21.856-1.644-33.55l.041.003-12.507-32.667c-12.88-33.415-.747-70.376%2027.41-90.31l-1.102-2.749c-3.685-9.583%201.14-20.438%2010.723-24.124%209.583-3.685%2020.439%201.14%2024.124%2010.723l1.654%203.239c34.881-3.556%2068.594%2015.855%2081.318%2049.33l15.24%2038.432c4.795%208.723%2011.831%2015.955%2021.028%2022.248z%22%20fill=%22#fff%22%20stroke=%22#303030%22%20stroke-width=%227%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22%20stroke-miterlimit=%2210%22/%3E%3Cpath%20d=%22M64.268%20268.838l45.015-17.115s7.963%2024.296-14.427%2030.38c-22.39%206.086-30.588-13.265-30.588-13.265z%22%20id=%22path826%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%227%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/g%3E%3Cg%20id=%22layer3%22%3E%3Crect%20id=%22rect845%22%20width=%22135.189%22%20height=%22135.189%22%20x=%2295.783%22%20y=%223.671%22%20ry=%2219.847%22%20fill=%22#55acee%22%20stroke=%22#303030%22%20stroke-width=%227%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22%20stroke-miterlimit=%2210%22/%3E%3C/g%3E%3Cg%20id=%22layer4%22%3E%3Cpath%20class=%22st2%22%20d=%22M172.724%2052.533V27.647h-9.888L144.047%2037.7l2.308%208.9%2014.833-8.076h.33v74.824H172.724V52.533z%22%20id=%22path7%22%20fill=%22#303030%22%20stroke-width=%2214.425%22/%3E%3C/g%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "9f09a4af-8f7a-45c3-af7b-293a244e76d9",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 200,
                "y": 64
              }
            },
            {
              "id": "3ae2d46d-7981-497a-899f-b60bfae0f43e",
              "type": "basic.input",
              "data": {
                "name": "set",
                "clock": false
              },
              "position": {
                "x": 200,
                "y": 152
              }
            },
            {
              "id": "1cb167a4-9e2a-416b-803e-da7b6151eaa5",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 720,
                "y": 152
              }
            },
            {
              "id": "86eb8c81-17fc-4371-bd21-51f429191f3c",
              "type": "basic.input",
              "data": {
                "name": "rst",
                "clock": false
              },
              "position": {
                "x": 200,
                "y": 232
              }
            },
            {
              "id": "bf12a800-db30-4289-a7c5-8c08438f9a39",
              "type": "basic.constant",
              "data": {
                "name": "",
                "value": "0",
                "local": false
              },
              "position": {
                "x": 464,
                "y": 0
              }
            },
            {
              "id": "90068dea-9e7b-4a0f-afa3-e6585d0d8542",
              "type": "basic.code",
              "data": {
                "code": "reg q = INI;\n\nalways @(posedge clk)\n  if (set)\n    q <= 1'b1;\n  else if (rst)\n    q<=1'b0;",
                "params": [
                  {
                    "name": "INI"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "set"
                    },
                    {
                      "name": "rst"
                    }
                  ],
                  "out": [
                    {
                      "name": "q"
                    }
                  ]
                }
              },
              "position": {
                "x": 400,
                "y": 120
              },
              "size": {
                "width": 224,
                "height": 128
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "9f09a4af-8f7a-45c3-af7b-293a244e76d9",
                "port": "out"
              },
              "target": {
                "block": "90068dea-9e7b-4a0f-afa3-e6585d0d8542",
                "port": "clk"
              },
              "vertices": [
                {
                  "x": 336,
                  "y": 104
                }
              ]
            },
            {
              "source": {
                "block": "3ae2d46d-7981-497a-899f-b60bfae0f43e",
                "port": "out"
              },
              "target": {
                "block": "90068dea-9e7b-4a0f-afa3-e6585d0d8542",
                "port": "set"
              }
            },
            {
              "source": {
                "block": "86eb8c81-17fc-4371-bd21-51f429191f3c",
                "port": "out"
              },
              "target": {
                "block": "90068dea-9e7b-4a0f-afa3-e6585d0d8542",
                "port": "rst"
              },
              "vertices": [
                {
                  "x": 344,
                  "y": 248
                }
              ]
            },
            {
              "source": {
                "block": "90068dea-9e7b-4a0f-afa3-e6585d0d8542",
                "port": "q"
              },
              "target": {
                "block": "1cb167a4-9e2a-416b-803e-da7b6151eaa5",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "bf12a800-db30-4289-a7c5-8c08438f9a39",
                "port": "constant-out"
              },
              "target": {
                "block": "90068dea-9e7b-4a0f-afa3-e6585d0d8542",
                "port": "INI"
              }
            }
          ]
        }
      }
    },
    "21cfcc19a4ad14c5fb5e8cfebd018ec356fe7542": {
      "package": {
        "name": "0",
        "version": "0.1",
        "description": "Un bit constante a 0",
        "author": "Jesus Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2233.563%22%20height=%2257.469%22%20viewBox=%220%200%2031.465601%2053.876499%22%3E%3Cpath%20d=%22M21.822%2032.843l4.092%208.992-3.772%209.727%204.181%201.31m-12.967-19.26s-1.091%208.253-2.585%208.919C9.278%2043.198%201%2049.389%201%2049.389l2.647%203.256%22%20fill=%22none%22%20stroke=%22green%22%20stroke-width=%222%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22-.863%22%20y=%2230.575%22%20transform=%22scale(.90756%201.10186)%22%20font-weight=%22400%22%20font-size=%2254.594%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22green%22%3E%3Ctspan%20x=%22-.863%22%20y=%2230.575%22%20style=%22-inkscape-font-specification:'sans-serif%20Bold%20Italic'%22%20font-style=%22italic%22%20font-weight=%22700%22%3Eo%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3d584b0a-29eb-47af-8c43-c0822282ef05",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 512,
                "y": 160
              }
            },
            {
              "id": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
              "type": "basic.code",
              "data": {
                "code": "//-- Bit constante a 0\nassign q = 1'b0;\n\n",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "q"
                    }
                  ]
                }
              },
              "position": {
                "x": 168,
                "y": 112
              },
              "size": {
                "width": 256,
                "height": 160
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
                "port": "q"
              },
              "target": {
                "block": "3d584b0a-29eb-47af-8c43-c0822282ef05",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "8e2728307baccbf26c01cdb87bcfba8ca64a435c": {
      "package": {
        "name": "Subida",
        "version": "0.1",
        "description": "Detector de flanco de subida. Emite un tic cuando detecta un flanco ascendente",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22363.337%22%20height=%22251.136%22%20viewBox=%220%200%2096.132868%2066.446441%22%3E%3Cdefs%3E%3Cmarker%20orient=%22auto%22%20id=%22a%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M2.308%200l-3.46%202v-4z%22%20fill=%22red%22%20fill-rule=%22evenodd%22%20stroke=%22red%22%20stroke-width=%22.5332%22/%3E%3C/marker%3E%3C/defs%3E%3Cg%20transform=%22translate(-63.113%20-50.902)%22%3E%3Cg%20fill=%22none%22%20stroke=%22#00f%22%20stroke-linecap=%22round%22%3E%3Cpath%20d=%22M76.611%2083.336l6.027%207.974-5.055%206.03%201.75%201.557M75.371%2083.53l-3.5%207.975-7.97%201.556.583%202.528%22%20stroke-width=%221.058%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M75.907%2083.53V53.588%22%20stroke-width=%223.969%22/%3E%3Cpath%20d=%22M65.118%2063.338l10.688-10.452%2010.351%2010.452%22%20stroke-width=%223.969%22%20stroke-linejoin=%22round%22/%3E%3C/g%3E%3Cpath%20d=%22M123.88%2069.103c2.17%203.317%204.013%202.718%205.68%200%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%22.529%22%20stroke-linecap=%22round%22/%3E%3Cpath%20d=%22M132.326%2095.38V51.614h-11.225v43.497%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%221.323%22%20stroke-linecap=%22round%22/%3E%3Cellipse%20cx=%22112.489%22%20cy=%2297.866%22%20rx=%227.009%22%20ry=%222.635%22%20transform=%22rotate(-1.418)%22%20fill=%22#00f%22%20stroke=%22#00f%22%20stroke-width=%22.265%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cellipse%20cx=%22-140.807%22%20cy=%2291.678%22%20rx=%227.009%22%20ry=%222.635%22%20transform=%22scale(-1%201)%20rotate(-1.418)%22%20fill=%22#00f%22%20stroke=%22#00f%22%20stroke-width=%22.265%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M124.8%2059.416v3.875M128.39%2059.416v3.875%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%22.529%22/%3E%3Cpath%20d=%22M85.794%2074.097h21.381%22%20fill=%22red%22%20stroke=%22red%22%20stroke-width=%222.646%22%20marker-end=%22url(#a)%22/%3E%3Cg%20transform=%22matrix(.842%200%200%20.842%2062.024%2042.68)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "4196184b-4a60-493b-bcc6-c95958483683",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 152,
                "y": 176
              }
            },
            {
              "id": "1d2e403f-0fa6-41fd-83a9-4f309eadd855",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 624,
                "y": 200
              }
            },
            {
              "id": "b6426b43-dcda-418d-b6d3-4764b5bc0b25",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": false
              },
              "position": {
                "x": 152,
                "y": 232
              }
            },
            {
              "id": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
              "type": "basic.code",
              "data": {
                "code": "reg q = 0;\n\nalways @(posedge clk)\n  q <= i;\n  \nassign o = (~q & i);  ",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "i"
                    }
                  ],
                  "out": [
                    {
                      "name": "o"
                    }
                  ]
                }
              },
              "position": {
                "x": 336,
                "y": 176
              },
              "size": {
                "width": 232,
                "height": 112
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "b6426b43-dcda-418d-b6d3-4764b5bc0b25",
                "port": "out"
              },
              "target": {
                "block": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
                "port": "i"
              }
            },
            {
              "source": {
                "block": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
                "port": "o"
              },
              "target": {
                "block": "1d2e403f-0fa6-41fd-83a9-4f309eadd855",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "4196184b-4a60-493b-bcc6-c95958483683",
                "port": "out"
              },
              "target": {
                "block": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
                "port": "clk"
              }
            }
          ]
        }
      }
    },
    "2814a1ad2ca9db581a01ec880d388f1ba9523c1b": {
      "package": {
        "name": "Separador-bus-1-5",
        "version": "0.1",
        "description": "Separador de bus de 6-bits en 1 bit y bus de 5 bits",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22354.768%22%20height=%22241.058%22%20viewBox=%220%200%20332.59497%20225.99201%22%3E%3Cpath%20d=%22M168.377%2077.643l61.147-60.938C240.21%206.25%20254.56.461%20269.484.5h62.611v26.186l-61.698.046c-8.012-.043-15.705%203.133-21.47%208.81L187.48%2096.857a57.292%2057.292%200%200%201-39.993%2016.139%2057.292%2057.292%200%200%201%2039.993%2016.14l61.448%2061.314c5.765%205.677%2013.458%208.853%2021.47%208.81l61.698.046v26.186h-62.612c-14.924.039-29.463-5.9-40.204-16.28l-60.902-60.863a29.857%2029.857%200%200%200-21.347-8.81L.5%20139.427V86.457h146.524a29.884%2029.884%200%200%200%2021.353-8.814z%22%20fill=%22green%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "ff382b55-361b-4e5c-aba9-8d018d8320a3",
              "type": "basic.output",
              "data": {
                "name": "o1"
              },
              "position": {
                "x": 584,
                "y": 144
              }
            },
            {
              "id": "d3394625-6e06-440a-a47d-c2a06daedcdb",
              "type": "basic.input",
              "data": {
                "name": "i",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 120,
                "y": 200
              }
            },
            {
              "id": "1679c4a2-c9cd-4327-9967-d81e14d18dda",
              "type": "basic.output",
              "data": {
                "name": "o0",
                "range": "[4:0]",
                "size": 5
              },
              "position": {
                "x": 584,
                "y": 232
              }
            },
            {
              "id": "16e78204-213e-4833-9096-89d735307ec2",
              "type": "basic.code",
              "data": {
                "code": "assign o1 = i[5];\nassign o0 = i[4:0];\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i",
                      "range": "[5:0]",
                      "size": 6
                    }
                  ],
                  "out": [
                    {
                      "name": "o1"
                    },
                    {
                      "name": "o0",
                      "range": "[4:0]",
                      "size": 5
                    }
                  ]
                }
              },
              "position": {
                "x": 296,
                "y": 176
              },
              "size": {
                "width": 208,
                "height": 112
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "d3394625-6e06-440a-a47d-c2a06daedcdb",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i"
              },
              "size": 6
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o0"
              },
              "target": {
                "block": "1679c4a2-c9cd-4327-9967-d81e14d18dda",
                "port": "in"
              },
              "size": 5
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o1"
              },
              "target": {
                "block": "ff382b55-361b-4e5c-aba9-8d018d8320a3",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "c89ab7c8b644f8ff5e6b7d27a657f7e3a247b09b": {
      "package": {
        "name": "Contador-6bits-up-system-ena",
        "version": "0.1",
        "description": "Contador del sistema, ascendente, de 6 bits, con enable ",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22426.236%22%20height=%22274.678%22%20viewBox=%220%200%20112.775%2072.67534%22%3E%3Cdefs%3E%3Cmarker%20id=%22a%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M2.308%200l-3.46%202v-4z%22%20fill=%22#00f%22%20fill-rule=%22evenodd%22%20stroke=%22#00f%22%20stroke-width=%22.5332%22/%3E%3C/marker%3E%3C/defs%3E%3Cg%20transform=%22translate(-42.332%20-.654)%22%3E%3Cpath%20d=%22M138.803%2040.204V8.626%22%20fill=%22#00f%22%20stroke=%22#00f%22%20stroke-width=%222.806%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22%20marker-end=%22url(#a)%22/%3E%3Crect%20rx=%223.819%22%20ry=%223.819%22%20y=%225.559%22%20x=%2288.82%22%20height=%2265.112%22%20width=%2240.195%22%20fill=%22#666%22%20stroke=%22#000%22%20stroke-width=%222.037%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Ctext%20transform=%22scale(.94516%201.05802)%22%20y=%2254.137%22%20x=%2298.111%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2212.222%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222.037%22%3E%3Ctspan%20style=%22line-height:1.25;-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%2254.137%22%20x=%2298.111%22%20font-weight=%22700%22%20font-size=%2248.52%22%3E0%3C/tspan%3E%3C/text%3E%3Cpath%20d=%22M90.346%2039.57h37.78%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%223.056%22%20stroke-linecap=%22square%22%20stroke-linejoin=%22round%22/%3E%3Crect%20rx=%223.819%22%20ry=%223.819%22%20y=%225.559%22%20x=%2243.351%22%20height=%2265.112%22%20width=%2240.195%22%20fill=%22#666%22%20stroke=%22#000%22%20stroke-width=%222.037%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Ctext%20transform=%22scale(.94516%201.05802)%22%20y=%2254.137%22%20x=%2250.004%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2212.222%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222.037%22%3E%3Ctspan%20style=%22line-height:1.25;-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%2254.137%22%20x=%2250.004%22%20font-weight=%22700%22%20font-size=%2248.52%22%3E0%3C/tspan%3E%3C/text%3E%3Cpath%20d=%22M44.876%2039.57h37.781%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%223.056%22%20stroke-linecap=%22square%22%20stroke-linejoin=%22round%22/%3E%3Cg%20transform=%22matrix(1.00937%200%200%201.00937%2038.56%20-16.18)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "c90da543-4b9c-4f4c-a5fa-7e1166ee1dd3",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 264,
                "y": 200
              }
            },
            {
              "id": "7db964fd-e6ba-4f63-ba60-704490452fd6",
              "type": "basic.output",
              "data": {
                "name": "",
                "range": "[5:0]",
                "size": 6
              },
              "position": {
                "x": 744,
                "y": 232
              }
            },
            {
              "id": "36b50629-7161-42ec-9310-b9de76429b43",
              "type": "basic.input",
              "data": {
                "name": "ena",
                "clock": false
              },
              "position": {
                "x": 264,
                "y": 272
              }
            },
            {
              "id": "e52eca2a-0fb8-4c7a-a67d-6ae98fd37e40",
              "type": "basic.code",
              "data": {
                "code": "reg [5:0] q;\n\nalways @(posedge clk)\nbegin\n  if (ena)\n    q <= q + 1;\nend",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "ena"
                    }
                  ],
                  "out": [
                    {
                      "name": "q",
                      "range": "[5:0]",
                      "size": 6
                    }
                  ]
                }
              },
              "position": {
                "x": 432,
                "y": 200
              },
              "size": {
                "width": 224,
                "height": 120
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "c90da543-4b9c-4f4c-a5fa-7e1166ee1dd3",
                "port": "out"
              },
              "target": {
                "block": "e52eca2a-0fb8-4c7a-a67d-6ae98fd37e40",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "e52eca2a-0fb8-4c7a-a67d-6ae98fd37e40",
                "port": "q"
              },
              "target": {
                "block": "7db964fd-e6ba-4f63-ba60-704490452fd6",
                "port": "in"
              },
              "size": 6
            },
            {
              "source": {
                "block": "36b50629-7161-42ec-9310-b9de76429b43",
                "port": "out"
              },
              "target": {
                "block": "e52eca2a-0fb8-4c7a-a67d-6ae98fd37e40",
                "port": "ena"
              }
            }
          ]
        }
      }
    },
    "35f267d0df6ffcb7fc33753bc9df9cf083642cca": {
      "package": {
        "name": "NOT",
        "version": "1.0.3",
        "description": "Puerta NOT",
        "author": "Jesús Arroyo, Juan González",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22317.651%22%20height=%22194.058%22%20version=%221%22%3E%3Cpath%20d=%22M69.246%204l161.86%2093.027-161.86%2093.031V4z%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linejoin=%22round%22/%3E%3Cellipse%20cx=%22253.352%22%20cy=%2296.736%22%20rx=%2221.393%22%20ry=%2221.893%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M4.057%2097.49h65.262m205.796%200h38.48%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%2281.112%22%20y=%22111.734%22%20transform=%22scale(.99532%201.0047)%22%20font-weight=%22400%22%20font-size=%2249.675%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#00f%22%3E%3Ctspan%20x=%2281.112%22%20y=%22111.734%22%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20font-weight=%22700%22%3ENot%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "18c2ebc7-5152-439c-9b3f-851c59bac834",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 64,
                "y": 144
              }
            },
            {
              "id": "664caf9e-5f40-4df4-800a-b626af702e62",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 752,
                "y": 144
              }
            },
            {
              "id": "5365ed8c-e5db-4445-938f-8d689830ea5c",
              "type": "basic.code",
              "data": {
                "code": "//-- Puerta NOT\n\n//-- module (input wire a, output wire c);\n\n\nassign c = ~a;\n\n\n//-- endmodule\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "a"
                    }
                  ],
                  "out": [
                    {
                      "name": "c"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 48
              },
              "size": {
                "width": 400,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "18c2ebc7-5152-439c-9b3f-851c59bac834",
                "port": "out"
              },
              "target": {
                "block": "5365ed8c-e5db-4445-938f-8d689830ea5c",
                "port": "a"
              }
            },
            {
              "source": {
                "block": "5365ed8c-e5db-4445-938f-8d689830ea5c",
                "port": "c"
              },
              "target": {
                "block": "664caf9e-5f40-4df4-800a-b626af702e62",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "26f57ab819923cfb72331d71a53aae8ab0714455": {
      "package": {
        "name": "Separador-bus",
        "version": "0.1",
        "description": "Separador de bus de 16-bits en buses de 8 bits",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22354.768%22%20height=%22241.058%22%20viewBox=%220%200%20332.59497%20225.99201%22%3E%3Cpath%20d=%22M168.377%2077.643l61.147-60.938C240.21%206.25%20254.56.461%20269.484.5h62.611v26.186l-61.698.046c-8.012-.043-15.705%203.133-21.47%208.81L187.48%2096.857a57.292%2057.292%200%200%201-39.993%2016.139%2057.292%2057.292%200%200%201%2039.993%2016.14l61.448%2061.314c5.765%205.677%2013.458%208.853%2021.47%208.81l61.698.046v26.186h-62.612c-14.924.039-29.463-5.9-40.204-16.28l-60.902-60.863a29.857%2029.857%200%200%200-21.347-8.81L.5%20139.427V86.457h146.524a29.884%2029.884%200%200%200%2021.353-8.814z%22%20fill=%22green%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "ae5a4023-0e63-4bdb-8963-31d3e3f13a90",
              "type": "basic.output",
              "data": {
                "name": "o1",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 584,
                "y": 144
              }
            },
            {
              "id": "65464f98-4fb4-4295-ab73-153196ce1d0d",
              "type": "basic.input",
              "data": {
                "name": "i",
                "range": "[15:0]",
                "clock": false,
                "size": 16
              },
              "position": {
                "x": 120,
                "y": 200
              }
            },
            {
              "id": "c675bded-7009-4371-b928-dadba3620245",
              "type": "basic.output",
              "data": {
                "name": "o0",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 584,
                "y": 272
              }
            },
            {
              "id": "16e78204-213e-4833-9096-89d735307ec2",
              "type": "basic.code",
              "data": {
                "code": "assign o1 = i[15:8];\nassign o0 = i[7:0];",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "o1",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "o0",
                      "range": "[7:0]",
                      "size": 8
                    }
                  ]
                }
              },
              "position": {
                "x": 296,
                "y": 176
              },
              "size": {
                "width": 208,
                "height": 112
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o0"
              },
              "target": {
                "block": "c675bded-7009-4371-b928-dadba3620245",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o1"
              },
              "target": {
                "block": "ae5a4023-0e63-4bdb-8963-31d3e3f13a90",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "65464f98-4fb4-4295-ab73-153196ce1d0d",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i"
              },
              "size": 16
            }
          ]
        }
      }
    },
    "b9ce1495492d9bb52158ff7ab53777abfad9c97d": {
      "package": {
        "name": "Serial-rx",
        "version": "0.2",
        "description": "Receptor serie asíncrono. Velocidad por defecto: 115200 baudios",
        "author": "Juan Gonzalez-Gomez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20height=%22223.269%22%20width=%22293.137%22%20viewBox=%220%200%20274.81662%20209.31615%22%3E%3Cg%20transform=%22matrix(-1.04907%200%200%201.04907%20-113.38%20-102.544)%22%20stroke=%22#000%22%3E%3Cpath%20d=%22M-170.798%20177.526l.315%2036.011%2040.397-37.263v-33.51z%22%20fill=%22#fff%22%20stroke-width=%223.541%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M-308.584%20177.892l53.235-35.7%20124.635.628-39.456%2035.7%22%20fill=%22#fff%22%20stroke-width=%223.541%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Crect%20ry=%223.509%22%20height=%2236.325%22%20width=%22139.039%22%20y=%22178.153%22%20x=%22-308.895%22%20fill=%22#fff%22%20stroke-width=%223.541%22%20stroke-linecap=%22square%22/%3E%3Cg%20transform=%22matrix(1.88858%200%200%201.88858%20-312.436%20138.651)%22%20stroke-width=%22.938%22%20stroke-linecap=%22square%22%3E%3Ccircle%20cy=%2230.367%22%20cx=%2211.326%22%20r=%223.15%22%20fill=%22red%22/%3E%3Ccircle%20cy=%2230.367%22%20cx=%2220.611%22%20r=%223.15%22%20fill=%22#faa%22/%3E%3Ccircle%20cy=%2230.367%22%20cx=%2262.82%22%20r=%223.15%22%20fill=%22green%22/%3E%3Ccircle%20cy=%2230.367%22%20cx=%2230.554%22%20r=%223.15%22%20fill=%22red%22/%3E%3C/g%3E%3C/g%3E%3Ctext%20y=%2228.295%22%20x=%2270.801%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2265.172%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%20stroke-width=%221.209%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%2228.295%22%20x=%2270.801%22%20font-weight=%22700%22%20font-size=%2237.241%22%3ESerial%3C/tspan%3E%3C/text%3E%3Cg%20transform=%22translate(-49.71%20-39.925)%20scale(2.8106)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3Ccircle%20cx=%22233.043%22%20cy=%2281.071%22%20r=%2240.92%22%20fill=%22#ececec%22%20stroke=%22green%22%20stroke-width=%221.71%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M261.766%2092.931h-4.696V67.437h-48.103v25.295h-5.116%22%20fill=%22none%22%20stroke=%22green%22%20stroke-width=%224.275%22%20stroke-linecap=%22round%22/%3E%3Ctext%20y=%22173.032%22%20x=%2287.94%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2265.172%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%20stroke-width=%221.209%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%22173.032%22%20x=%2287.94%22%20font-weight=%22700%22%20font-size=%2237.241%22%3ERX%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "b82422cd-6ac3-4b32-a8b8-3aff2a066775",
              "type": "basic.output",
              "data": {
                "name": "",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 936,
                "y": 96
              }
            },
            {
              "id": "9b46173d-7429-4d90-8701-a2eae9f88c53",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": -72,
                "y": 160
              }
            },
            {
              "id": "df254332-7ba1-4c4e-b14c-97b5211f8dff",
              "type": "basic.output",
              "data": {
                "name": "busy"
              },
              "position": {
                "x": 944,
                "y": 352
              }
            },
            {
              "id": "2f6a3bb1-2010-4f69-a978-717528dc5160",
              "type": "basic.input",
              "data": {
                "name": "RX",
                "clock": false
              },
              "position": {
                "x": -80,
                "y": 544
              }
            },
            {
              "id": "d7ebc6ce-2cde-4e33-8c9d-b439fd2cb3e0",
              "type": "basic.output",
              "data": {
                "name": "rcv"
              },
              "position": {
                "x": 944,
                "y": 608
              }
            },
            {
              "id": "38758516-ff7d-4688-a171-e35bb9f50bd0",
              "type": "basic.constant",
              "data": {
                "name": "",
                "value": "115200",
                "local": false
              },
              "position": {
                "x": 416,
                "y": -136
              }
            },
            {
              "id": "d84b0e8b-3264-47e9-953f-b80b712fc373",
              "type": "basic.code",
              "data": {
                "code": "//-- Constantes para obtener las velocidades estándares\n`define B115200 104 \n`define B57600  208\n`define B38400  313\n`define B19200  625\n`define B9600   1250\n`define B4800   2500\n`define B2400   5000\n`define B1200   10000\n`define B600    20000\n`define B300    40000\n\n//-- Constante para calcular los baudios\nlocalparam BAUDRATE = (BAUD==115200) ? `B115200 : //-- OK\n                      (BAUD==57600)  ? `B57600  : //-- OK\n                      (BAUD==38400)  ? `B38400  : //-- Ok\n                      (BAUD==19200)  ? `B19200  : //-- OK\n                      (BAUD==9600)   ? `B9600   : //-- OK\n                      (BAUD==4800)   ? `B4800   : //-- OK \n                      (BAUD==2400)   ? `B2400   : //-- OK\n                      (BAUD==1200)   ? `B1200   : //-- OK\n                      (BAUD==600)    ? `B600    : //-- OK\n                      (BAUD==300)    ? `B300    : //-- OK\n                      `B115200 ;  //-- Por defecto 115200 baudios\n\n\n\n\n//-- Calcular el numero de bits para almacenar el divisor\nlocalparam N = $clog2(BAUDRATE);\n\n// Sincronizacion. Evitar \n// problema de la metaestabilidad\n\nreg d1;\nreg din;\n\nalways @(posedge clk)\n d1 <= RX;\n \n//-- Din contiene el dato serie de entrada listo para usarse   \nalways @(posedge clk)\n  din <= d1;\n  \n//------ Detectar el bit de start: flanco de bajada en din\n\n//-- Registro temporal\nreg q_t0 = 0;\n\nalways @(posedge clk)\n  q_t0 <= din;\n  \n//-- El cable din_fe es un \"tic\" que aparece cuando llega el flanco de \n//-- bajada\nwire din_fe = (q_t0 & ~din);\n\n//-------- ESTADO DEL RECEPTOR\n\n//-- 0: Apagado. Esperando\n//-- 1: Encendido. Activo. Recibiendo dato\nreg state = 0;\n\nalways @(posedge clk)\n  //-- Se pasa al estado activo al detectar el flanco de bajada\n  //-- del bit de start\n  if (din_fe)\n    state <= 1'b1;\n    \n  //-- Se pasa al estado inactivo al detectar la señal rst_state    \n  else if (rst_state)\n    state<=1'b0;\n\n//------------------ GENERADOR DE BAUDIOS -----------------------------\n//-- Se activa cuando el receptor está encendido\n\n\n//-- Calcular la mitad del divisor BAUDRATE/2\nlocalparam BAUD2 = (BAUDRATE >> 1);\n\n//-- Contador del sistema, para esperar un tiempo de  \n//-- medio bit (BAUD2)\n\n//-- NOTA: podria tener N-2 bits en principio\nreg [N-1: 0] div2counter = 0;\n\n//-- Se genera primero un retraso de BAUD/2\n//-- El proceso comienza cuando el estado pasa a 1\n\nalways @(posedge clk)\n\n  //-- Contar\n  if (state) begin\n    //-- Solo cuenta hasta BAUD2, luego  \n    //-- se queda en ese valor hasta que\n    //-- ena se desactiva\n    if (div2counter < BAUD2) \n      div2counter <= div2counter + 1;\n  end else\n    div2counter <= 0;\n\n//-- Habilitar el generador de baudios principal\n//-- cuando termine este primer contador\nwire ena2 = (div2counter == BAUD2);\n\n\n//------ GENERADOR DE BAUDIOS PRINCIPAL\n\n//-- Contador para implementar el divisor\n//-- Es un contador modulo BAUDRATE\nreg [N-1:0] divcounter = 0;\n\n//-- Cable de reset para el contador\nwire reset;\n\n//-- Contador con reset\nalways @(posedge clk)\n  if (reset)\n    divcounter <= 0;\n  else\n    divcounter <= divcounter + 1;\n\n//-- Esta señal contiene el tic\nwire ov = (divcounter == BAUDRATE-1);\n\n//-- Comparador que resetea el contador cuando se alcanza el tope\nassign reset = ov | (ena2 == 0);\n\n//-- El cable con el tic para capturar cada bit lo llamamos\n//-- bit_tic, y es la señal de overflow del contador\nwire bit_tic = ov;\n\n//-------- REGISTRO DE DESPLAZAMIENTO -----------\n//-- Es el componente que pasa los bits recibidos a paralelo\n//-- La señal de desplazamiento usada es bit_tic, pero sólo cuando  \n//-- estamos en estado de encendido (state==1)\n//-- Es un registro de 9 bits: 8 bits de datos + bit de stop\n//-- El bit de start no se almacena, es el que ha servido para\n//-- arrancar el receptor\n\nreg [8:0] sr = 0;\n\nalways @(posedge clk)\n  //-- Se captura el bit cuando llega y el receptor\n  //-- esta activado\n  if (bit_tic & state)\n    sr <= {din, sr[8:1]};\n    \n//-- El dato recibido se encuentran en los 8 bits menos significativos\n//-- una vez recibidos los 9 bits\n\n//-------- CONTADOR de bits recibidos\n\n//-- Internamente usamos un bit mas\n//-- (N+1) bits\nreg [4:0] cont = 0;\n\nalways @(posedge clk)\n\n  //-- El contador se pone a 0 si hay un overflow o \n  //-- el receptor está apagado \n  if ((state==0)| ov2)\n    cont <= 0;\n  else\n    //-- Receptor activado: Si llega un bit se incrementa\n    if (bit_tic)\n      cont <= cont + 1;\n      \n//-- Comprobar overflow\nwire ov2 = (cont == 9);\n    \n//-- Esta señal de overflow indica el final de la recepción\nwire fin = ov2;\n\n//-- Se conecta al reset el biestable de estado\nwire rst_state = fin;\n\n//----- REGISTRO DE DATOS -------------------\n//-- Registro de 8 bits que almacena el dato final\n\n//-- Bus de salida con el dato recibido\nreg data = 0;\n\nalways @(posedge clk)\n\n  //-- Si se ha recibido el ultimo bit, capturamos el dato\n  //-- que se encuentra en los 8 bits de menor peso del\n  //-- registro de desplazamiento\n  if (fin)\n    data <= sr[7:0];\n\n//-- Comunicar que se ha recibido un dato\n//-- Tic de dato recibido\nreg rcv = 0;\nalways @(posedge clk)\n  rcv <= fin;\n\n//-- La señal de busy es directamente el estado del receptor\nassign busy = state;\n\n",
                "params": [
                  {
                    "name": "BAUD"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "RX"
                    }
                  ],
                  "out": [
                    {
                      "name": "data",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "busy"
                    },
                    {
                      "name": "rcv"
                    }
                  ]
                }
              },
              "position": {
                "x": 152,
                "y": 0
              },
              "size": {
                "width": 616,
                "height": 768
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "9b46173d-7429-4d90-8701-a2eae9f88c53",
                "port": "out"
              },
              "target": {
                "block": "d84b0e8b-3264-47e9-953f-b80b712fc373",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "2f6a3bb1-2010-4f69-a978-717528dc5160",
                "port": "out"
              },
              "target": {
                "block": "d84b0e8b-3264-47e9-953f-b80b712fc373",
                "port": "RX"
              }
            },
            {
              "source": {
                "block": "d84b0e8b-3264-47e9-953f-b80b712fc373",
                "port": "data"
              },
              "target": {
                "block": "b82422cd-6ac3-4b32-a8b8-3aff2a066775",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "d84b0e8b-3264-47e9-953f-b80b712fc373",
                "port": "rcv"
              },
              "target": {
                "block": "d7ebc6ce-2cde-4e33-8c9d-b439fd2cb3e0",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "38758516-ff7d-4688-a171-e35bb9f50bd0",
                "port": "constant-out"
              },
              "target": {
                "block": "d84b0e8b-3264-47e9-953f-b80b712fc373",
                "port": "BAUD"
              }
            },
            {
              "source": {
                "block": "d84b0e8b-3264-47e9-953f-b80b712fc373",
                "port": "busy"
              },
              "target": {
                "block": "df254332-7ba1-4c4e-b14c-97b5211f8dff",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "c6459cf10c1547cd019a1270349def563247dd01": {
      "package": {
        "name": "Serial-tx",
        "version": "0.2",
        "description": "Transmisor serie",
        "author": "Juan Gonzalez-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20height=%22223.269%22%20width=%22293.137%22%20viewBox=%220%200%20274.81662%20209.31615%22%3E%3Cg%20transform=%22translate(347.142%20-102.544)%20scale(1.04907)%22%20stroke=%22#000%22%3E%3Cpath%20d=%22M-170.798%20177.526l.315%2036.011%2040.397-37.263v-33.51z%22%20fill=%22#fff%22%20stroke-width=%223.541%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M-308.584%20177.892l53.235-35.7%20124.635.628-39.456%2035.7%22%20fill=%22#fff%22%20stroke-width=%223.541%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Crect%20ry=%223.509%22%20height=%2236.325%22%20width=%22139.039%22%20y=%22178.153%22%20x=%22-308.895%22%20fill=%22#fff%22%20stroke-width=%223.541%22%20stroke-linecap=%22square%22/%3E%3Cg%20transform=%22matrix(1.88858%200%200%201.88858%20-312.436%20138.651)%22%20stroke-width=%22.938%22%20stroke-linecap=%22square%22%3E%3Ccircle%20cy=%2230.367%22%20cx=%2211.326%22%20r=%223.15%22%20fill=%22red%22/%3E%3Ccircle%20cy=%2230.367%22%20cx=%2220.611%22%20r=%223.15%22%20fill=%22#faa%22/%3E%3Ccircle%20cy=%2230.367%22%20cx=%2262.82%22%20r=%223.15%22%20fill=%22green%22/%3E%3Ccircle%20cy=%2230.367%22%20cx=%2230.554%22%20r=%223.15%22%20fill=%22red%22/%3E%3C/g%3E%3C/g%3E%3Ctext%20y=%2228.295%22%20x=%2270.801%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2265.172%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%20stroke-width=%221.209%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%2228.295%22%20x=%2270.801%22%20font-weight=%22700%22%20font-size=%2237.241%22%3ESerial%3C/tspan%3E%3C/text%3E%3Cg%20transform=%22translate(-49.71%20-39.925)%20scale(2.8106)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3Cg%20transform=%22translate(-240.978%20-39.925)%20scale(2.8106)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3Ccircle%20cx=%22233.043%22%20cy=%2281.071%22%20r=%2240.92%22%20fill=%22#ececec%22%20stroke=%22green%22%20stroke-width=%221.71%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M261.766%2092.931h-4.696V67.437h-48.103v25.295h-5.116%22%20fill=%22none%22%20stroke=%22green%22%20stroke-width=%224.275%22%20stroke-linecap=%22round%22/%3E%3Ctext%20y=%22165.6%22%20x=%22108.068%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2265.172%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%20stroke-width=%221.209%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%22165.6%22%20x=%22108.068%22%20font-weight=%22700%22%20font-size=%2237.241%22%3ETX%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "09701eaa-8d79-487f-b003-267e04095bb1",
              "type": "basic.output",
              "data": {
                "name": "TX"
              },
              "position": {
                "x": 960,
                "y": 120
              }
            },
            {
              "id": "4c296e24-7312-407a-8fb0-f3a6d4feb3ab",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": -16,
                "y": 120
              }
            },
            {
              "id": "27183891-b385-412b-bc55-21df1dd0280e",
              "type": "basic.input",
              "data": {
                "name": "",
                "range": "[7:0]",
                "clock": false,
                "size": 8
              },
              "position": {
                "x": -16,
                "y": 272
              }
            },
            {
              "id": "75d4695e-f445-4762-9ae9-c9bf0e51974f",
              "type": "basic.output",
              "data": {
                "name": "busy"
              },
              "position": {
                "x": 960,
                "y": 272
              }
            },
            {
              "id": "6bb28a95-e6e4-4044-9c22-c4404693b6b1",
              "type": "basic.input",
              "data": {
                "name": "txmit",
                "clock": false
              },
              "position": {
                "x": 0,
                "y": 424
              }
            },
            {
              "id": "42306dfc-8702-4c9a-98d6-56b4c86fff21",
              "type": "basic.output",
              "data": {
                "name": "done"
              },
              "position": {
                "x": 960,
                "y": 424
              }
            },
            {
              "id": "671d0b4d-317d-4aef-8422-8b9a400211a4",
              "type": "basic.constant",
              "data": {
                "name": "",
                "value": "115200",
                "local": false
              },
              "position": {
                "x": 480,
                "y": -72
              }
            },
            {
              "id": "3238443f-338d-4796-b54a-c463c5f191aa",
              "type": "basic.code",
              "data": {
                "code": "//-- Constantes para obtener las velocidades estándares\n`define B115200 104 \n`define B57600  208\n`define B38400  313\n`define B19200  625\n`define B9600   1250\n`define B4800   2500\n`define B2400   5000\n`define B1200   10000\n`define B600    20000\n`define B300    40000\n\n//-- Constante para calcular los baudios\nlocalparam BAUDRATE = (BAUD==115200) ? `B115200 : //-- OK\n                      (BAUD==57600)  ? `B57600  : //-- OK\n                      (BAUD==38400)  ? `B38400  : //-- Ok\n                      (BAUD==19200)  ? `B19200  : //-- OK\n                      (BAUD==9600)   ? `B9600   : //-- OK\n                      (BAUD==4800)   ? `B4800   : //-- OK \n                      (BAUD==2400)   ? `B2400   : //-- OK\n                      (BAUD==1200)   ? `B1200   : //-- OK\n                      (BAUD==600)    ? `B600    : //-- OK\n                      (BAUD==300)    ? `B300    : //-- OK\n                      `B115200 ;  //-- Por defecto 115200 baudios\n\n\n//---- GENERADOR DE BAUDIOS\n\n//-- Calcular el numero dde bits para almacenar el divisor\nlocalparam N = $clog2(BAUDRATE);\n\n//-- Contador para implementar el divisor\n//-- Es un contador modulo BAUDRATE\nreg [N-1:0] divcounter = 0;\n\n//-- Cable de reset para el contador\n//-- Comparador que resetea el contador cuando se alcanza el tope\n//-- o cuando el estado del biestable es 0 (apagado)\nwire reset = ov_gen | (state == 0);\n\n//-- Contador con reset\nalways @(posedge clk)\n  if (reset)\n    divcounter <= 0;\n  else\n    divcounter <= divcounter + 1;\n\n//-- Hemos llegado al final\nwire ov_gen = (divcounter == BAUDRATE-1);\n\n\n\n//-- REGISTRO DESPLAZAMIENTO\n\n//-- Salida serie. Inicialmete a 1 (reposo) \nreg TX = 1;\n\n//-- Registro de desplazamiento de 9 bits\n//-- Inicializado todo a 1s\nreg [8:0] q = 9'h1FF;\n\n//-- La entrada de shift es la salida del generador de baudios\nwire shift = ov_gen;\n\nalways @(posedge clk)\n  if (txmit_tic)\n  //-- Carga del registro\n    q <= {data, 1'b0};\n    \n  else if (shift)\n    //-- Desplazamiento. Rellenar con 1 (bit de stop)\n    q <= {1'b1, q[8:1]};\n    \n//-- Sacar el bit de menor peso por serial-out    \nwire so;\nassign so = q[0];\n\n//-- La salida tx la registramos\nalways @(posedge clk)\n  TX <= so;\n  \n//-- La señal de entrada txmit se pasa por un \n//-- detector de flancos de subida para generar un tic\nreg q_re = 0;\nwire txmit_tic;\n\nalways @(posedge clk)\n  q_re <= txmit;\n  \nassign txmit_tic = (~q_re & txmit);  \n\n\n\n//-- Estado de transmisor\n//-- 0: Parado\n//-- 1: Ocupado (transmitiendo)\nreg state = 0;\n  \nalways @(posedge clk)\n  //-- Empieza la transmision: ocupado\n  if (txmit)\n    state <= 1'b1;\n    \n  //-- Acaba la transmision: libre    \n  else if (ov)\n    state <= 1'b0;\n\n//-- Contador de bits enviados\nreg [3:0] bits = 0;\nalways @(posedge clk)\n  //-- Si la cuenta ha terminado... volver a 0\n  if (ov)\n    bits <= 2'b00;\n  else\n    if (shift)\n      bits <= bits + 1;\n\n//-- Comprobar si se ha transmitido el último bit (overflow)\n//-- 1 bit de start + 8 bits de datos + 1 bit de stop\nwire ov = (bits == 10);\n\n//-- La señal de ocupado es el estado del transmisor\nassign busy = state;\n\n//-- La señal de done es la de overflow pero retrasada un\n//-- periodo de reloj del sistema y que el biestable \n//-- llegue al estado de parado antes de que se \n//-- empiece otra transmision\n\nreg done=0;\n\nalways @(posedge clk)\n  done <= ov;\n",
                "params": [
                  {
                    "name": "BAUD"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "data",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "txmit"
                    }
                  ],
                  "out": [
                    {
                      "name": "TX"
                    },
                    {
                      "name": "busy"
                    },
                    {
                      "name": "done"
                    }
                  ]
                }
              },
              "position": {
                "x": 248,
                "y": 72
              },
              "size": {
                "width": 560,
                "height": 456
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "3238443f-338d-4796-b54a-c463c5f191aa",
                "port": "TX"
              },
              "target": {
                "block": "09701eaa-8d79-487f-b003-267e04095bb1",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "671d0b4d-317d-4aef-8422-8b9a400211a4",
                "port": "constant-out"
              },
              "target": {
                "block": "3238443f-338d-4796-b54a-c463c5f191aa",
                "port": "BAUD"
              }
            },
            {
              "source": {
                "block": "4c296e24-7312-407a-8fb0-f3a6d4feb3ab",
                "port": "out"
              },
              "target": {
                "block": "3238443f-338d-4796-b54a-c463c5f191aa",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "27183891-b385-412b-bc55-21df1dd0280e",
                "port": "out"
              },
              "target": {
                "block": "3238443f-338d-4796-b54a-c463c5f191aa",
                "port": "data"
              },
              "size": 8
            },
            {
              "source": {
                "block": "6bb28a95-e6e4-4044-9c22-c4404693b6b1",
                "port": "out"
              },
              "target": {
                "block": "3238443f-338d-4796-b54a-c463c5f191aa",
                "port": "txmit"
              }
            },
            {
              "source": {
                "block": "3238443f-338d-4796-b54a-c463c5f191aa",
                "port": "busy"
              },
              "target": {
                "block": "75d4695e-f445-4762-9ae9-c9bf0e51974f",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "3238443f-338d-4796-b54a-c463c5f191aa",
                "port": "done"
              },
              "target": {
                "block": "42306dfc-8702-4c9a-98d6-56b4c86fff21",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "3ba8d67fb4058347750139ac572144a6dc8c0cc7": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "640a6582-5f0d-45fa-9b5a-a78e8177b85f",
              "type": "basic.output",
              "data": {
                "name": "clk_out"
              },
              "position": {
                "x": 1904,
                "y": 152
              }
            },
            {
              "id": "16882ac1-42c7-4496-92f8-601b85af447e",
              "type": "basic.input",
              "data": {
                "name": "clk_in",
                "clock": false
              },
              "position": {
                "x": 248,
                "y": 208
              }
            },
            {
              "id": "69e81b91-3ebf-4c1a-b708-63e6c46046c4",
              "type": "basic.output",
              "data": {
                "name": "locked",
                "pins": [
                  {
                    "index": "0",
                    "name": "",
                    "value": ""
                  }
                ],
                "virtual": true
              },
              "position": {
                "x": 1160,
                "y": 440
              }
            },
            {
              "id": "5ac2426d-238a-4556-b328-2b315f13c70b",
              "type": "basic.code",
              "data": {
                "code": "   reg[27:0] counter = 28'd0;\n        parameter DIVISOR = 5;\n        always @(posedge clock_in)\n                begin\n                        counter <= counter + 28'd1;\n                        if(counter >= (DIVISOR - 1))\n                                        counter <= 28'd0;\n                end\n        assign clock_out = (counter < DIVISOR / 2) ? 1'b0 : 1'b1;",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clock_in"
                    }
                  ],
                  "out": [
                    {
                      "name": "clock_out"
                    }
                  ]
                }
              },
              "position": {
                "x": 1200,
                "y": 56
              },
              "size": {
                "width": 616,
                "height": 256
              }
            },
            {
              "id": "5d142677-bc9f-4646-a6b3-f3b4440b8f8b",
              "type": "basic.code",
              "data": {
                "code": "SB_PLL40_CORE #(\n\t\t.FEEDBACK_PATH(\"SIMPLE\"),\n\t\t.DIVR(4'b0100),\t\t\n\t\t.DIVF(7'b0101111),\t\n\t\t.DIVQ(3'b100),\t\t\n\t\t.FILTER_RANGE(3'b010)\t\n\t) uut (\n\t\t.LOCK(locked),\n\t\t.RESETB(1'b1),\n\t\t.BYPASS(1'b0),\n\t\t.REFERENCECLK(clk_in),\n\t\t.PLLOUTCORE(clk_out)\n\t\t);",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk_in"
                    }
                  ],
                  "out": [
                    {
                      "name": "clk_out"
                    },
                    {
                      "name": "locked"
                    }
                  ]
                }
              },
              "position": {
                "x": 400,
                "y": 120
              },
              "size": {
                "width": 488,
                "height": 240
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "5d142677-bc9f-4646-a6b3-f3b4440b8f8b",
                "port": "clk_out"
              },
              "target": {
                "block": "5ac2426d-238a-4556-b328-2b315f13c70b",
                "port": "clock_in"
              }
            },
            {
              "source": {
                "block": "16882ac1-42c7-4496-92f8-601b85af447e",
                "port": "out"
              },
              "target": {
                "block": "5d142677-bc9f-4646-a6b3-f3b4440b8f8b",
                "port": "clk_in"
              }
            },
            {
              "source": {
                "block": "5ac2426d-238a-4556-b328-2b315f13c70b",
                "port": "clock_out"
              },
              "target": {
                "block": "640a6582-5f0d-45fa-9b5a-a78e8177b85f",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "5d142677-bc9f-4646-a6b3-f3b4440b8f8b",
                "port": "locked"
              },
              "target": {
                "block": "69e81b91-3ebf-4c1a-b708-63e6c46046c4",
                "port": "in"
              }
            }
          ]
        }
      }
    }
  }
}