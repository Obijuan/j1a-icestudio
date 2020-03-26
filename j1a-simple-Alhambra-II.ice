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
          "id": "d3703daa-73b8-41a1-8f96-9e118d401a9f",
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
            "x": 848,
            "y": 16
          }
        },
        {
          "id": "51ffc131-a0be-4402-8d8a-d493aa097f71",
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
            "x": 1808,
            "y": 56
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
                "name": "RX",
                "value": "62"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 1176,
            "y": 104
          }
        },
        {
          "id": "134bee0f-d49e-44a5-b516-136280140b10",
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
            "x": 1808,
            "y": 120
          }
        },
        {
          "id": "5295e5c1-0bf9-461f-a8e4-4fdf586c1f6f",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "fuchsia",
            "name": "w4",
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
            "x": 840,
            "y": 120
          }
        },
        {
          "id": "e9ee0c57-2054-4b22-ba37-8e3824b76a2d",
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
            "virtual": true
          },
          "position": {
            "x": 1176,
            "y": 160
          }
        },
        {
          "id": "420cb073-0164-4994-aff2-52ccecf1e1a3",
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
            "virtual": true
          },
          "position": {
            "x": 840,
            "y": 184
          }
        },
        {
          "id": "77843c85-5ae4-4331-a590-0e7e2bc3a432",
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
            "x": 1800,
            "y": 184
          }
        },
        {
          "id": "11127019-1657-4653-bb9e-05d1d37070cc",
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
            "x": 1176,
            "y": 216
          }
        },
        {
          "id": "0b755e68-ff16-425a-aae3-f3fea766e8d4",
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
            "x": 832,
            "y": 248
          }
        },
        {
          "id": "68883952-c3b3-486d-8a09-8ad2e20c8625",
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
            "x": 1824,
            "y": 248
          }
        },
        {
          "id": "5635b99e-3fef-4b0a-a9fc-806edad7b076",
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
            "x": 1176,
            "y": 264
          }
        },
        {
          "id": "ba1e3f74-8fb7-4864-8f22-cd1ba63309fe",
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
            "x": 8,
            "y": 280
          }
        },
        {
          "id": "28867e8d-be43-4edc-b0d9-ab13ffb974e6",
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
            "x": 888,
            "y": 312
          }
        },
        {
          "id": "9373440c-282f-4ca8-afc0-1434cbe7fc34",
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
            "x": 8,
            "y": 368
          }
        },
        {
          "id": "06c4daac-b4e1-4e2f-8f77-ff04f6036b93",
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
            "x": 888,
            "y": 368
          }
        },
        {
          "id": "474f9a61-9b0b-45a7-8ac1-13757b0a9153",
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
            "x": 1728,
            "y": 384
          }
        },
        {
          "id": "2311157e-f95a-45f1-b0f3-fae6327d511b",
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
            "x": 872,
            "y": 432
          }
        },
        {
          "id": "4cda24d4-a3c1-49b8-a0b9-98339e420700",
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
            "x": 0,
            "y": 448
          }
        },
        {
          "id": "a442e1e3-49a1-4b50-af0f-65530888fd8c",
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
            "x": 1208,
            "y": 448
          }
        },
        {
          "id": "a6c3ecc6-1806-4869-b4d5-48c0a222a290",
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
            "x": 888,
            "y": 496
          }
        },
        {
          "id": "0ec733b1-535c-40d0-b802-7cdb57136885",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "fuchsia",
            "name": "w4",
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
            "x": 1208,
            "y": 504
          }
        },
        {
          "id": "cfd3dfc6-c268-4a23-9e33-0b04a68508a7",
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
            "x": 24,
            "y": 544
          }
        },
        {
          "id": "a2da3af8-2e41-42c8-b09b-ca94fe19cff4",
          "type": "basic.inputLabel",
          "data": {
            "name": "unlocked",
            "pins": [
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
            "x": 808,
            "y": 592
          }
        },
        {
          "id": "7d973072-fdc4-4bd9-bba2-4f7354223963",
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
            "x": -128,
            "y": 768
          }
        },
        {
          "id": "7b8177f3-a664-4971-8f1f-daf748b0dd9e",
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
            "x": -136,
            "y": 848
          }
        },
        {
          "id": "b4159c03-d0d1-4464-b55c-2e2af3b3cf6f",
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
            "x": 688,
            "y": 888
          }
        },
        {
          "id": "84935129-b4ae-4a7a-bc58-637987780743",
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
            "x": -136,
            "y": 904
          }
        },
        {
          "id": "61472292-3ce5-4a8e-aff3-2640eba07498",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "fuchsia",
            "name": "unlocked",
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
            "x": -120,
            "y": 968
          }
        },
        {
          "id": "a19ecd0a-edfb-456d-a814-d21b8891dfcf",
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
            "blockColor": "fuchsia"
          },
          "position": {
            "x": -112,
            "y": 1064
          }
        },
        {
          "id": "b09be0dc-b4ab-4c33-9b1d-7a7a1f2f097e",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "\"nuc.list\"",
            "local": false
          },
          "position": {
            "x": 304,
            "y": 656
          }
        },
        {
          "id": "69f24903-e5b6-43d9-8bfc-909949fc0d73",
          "type": "basic.code",
          "data": {
            "code": " //-- Puerto de salida\n  always @(posedge clk) \n    if (w4)\n      port <= dout[4:0];\n",
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
                  "name": "w4"
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
            "x": 1376,
            "y": 432
          },
          "size": {
            "width": 272,
            "height": 96
          }
        },
        {
          "id": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
          "type": "basic.code",
          "data": {
            "code": "// @include uart.v\n\n\n  buart _uart0 (\n     .clk(clk),\n     .resetq(1'b1),\n     .rx(uart_RXD),\n     .tx(TX),\n     .rd(uart0_rd),\n     .wr(uart0_wr),\n     .valid(uart0_valid),\n     .busy(uart0_busy),\n     .tx_data(dout_[7:0]),\n     .rx_data(uart0_data));\n     ",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "uart_RXD"
                },
                {
                  "name": "uart0_rd"
                },
                {
                  "name": "uart0_wr"
                },
                {
                  "name": "dout_",
                  "range": "[7:0]",
                  "size": 8
                }
              ],
              "out": [
                {
                  "name": "TX"
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
              ]
            }
          },
          "position": {
            "x": 1376,
            "y": 56
          },
          "size": {
            "width": 328,
            "height": 256
          }
        },
        {
          "id": "3c8e0ab1-5c56-48a0-881e-ddcf94bf771a",
          "type": "basic.info",
          "data": {
            "info": "## J1a - 9\n\nFunciona!  Va a 115200 baudios\nSin PLL\nNO usa el DTR: se puede probar desde el terminal de icestudio\nMemoria separada\nNo necesita usar el fichero mem.v\n\nPara probar los leds desde el terminal:\n\n```\n$1f leds\n: blink 32 0 do i leds 10 ms loop ;\nblink\n```\n",
            "readonly": true
          },
          "position": {
            "x": 32,
            "y": -296
          },
          "size": {
            "width": 560,
            "height": 232
          }
        },
        {
          "id": "f68cb39c-4a93-47c5-9073-253f0cee0917",
          "type": "3db97e88b7f9a2a65931f3638eaa612a255dccd7",
          "position": {
            "x": -40,
            "y": 200
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "e40e4536-5f7b-466d-bddf-4aac29652ef3",
          "type": "35f267d0df6ffcb7fc33753bc9df9cf083642cca",
          "position": {
            "x": 88,
            "y": 200
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
          "type": "basic.code",
          "data": {
            "code": "// @include mem.v\n\n//---------------------- memory\n\nwire we0 = 1'b1;\nwire we1 = 1'b1;\n//wire wclke0 = mem_wr & !mem_addr[12] & unlocked;\n//wire wclke1 = mem_wr & mem_addr[12] & unlocked;\n\nwire wclke = mem_wr & unlocked;\n\n//-- Definición de la tabla\n//-- Tabla de TAM elementos de M bits\nreg [15:0] tabla[0:4095];\n\n//-- Read the table\nalways @(posedge clk)\n  insn <= tabla[code_addr[11:0]];\n\n//-- Puerto escritura\nalways @(posedge clk)\n  if (wclke)\n      tabla[mem_addr[12:1]] <= dout;\n\n//-- Init table from PROG parameter\ninitial begin\n  if (PROG) $readmemh(PROG, tabla);\nend\n\n\n/*\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfdfcfcfffcfdfffffdfcfefefdfdfefefdfcfefefffefdfcfcfffdfefefefd),\n.INIT_1(256'hfdfefdfcfffdfefefcfefcfcfffcfefefdfffffffffcfffcfcfcfffefdfefdfc),\n.INIT_2(256'hfdfcfefffefcfefcfffffffefffefdfcfefefdfdfdfcfffcfdfcfdfcfdfefffc),\n.INIT_3(256'hfdfefefefcfdfdfcfdfefcfcfcfefdfdfffefefdfefcfcfdfefdfcfdfffdfcfc),\n.INIT_4(256'hfefcfcfffefcfefefefcfcfefefdfcfefffcfdfffffefefffdfcfdfdfffcfcfd),\n.INIT_5(256'hfffffefdfcfdfefffdfffefffefdfcfcfefcfefdfefcfcfcfffcfdfffcfcfcff),\n.INIT_6(256'hfefefefcfefefcfefcfcfcfefefefefefefcfefcfefefefefffcfefffffefffe),\n.INIT_7(256'hfefefefcfcfcfefcfefcfefefefefefefcfefcfefefefcfcfefcfefefefefcfe),\n.INIT_8(256'hfffefffefffdfcfcfcfefcfefcfcfcfefcfcfefcfcfcfcfefcfcfefcfcfcfefe),\n.INIT_9(256'hfcfcfffdfcfefdfffffdfdfdfffffffffffcfcfdfdfdfffdfffcfffefefefffe),\n.INIT_A(256'hfdfdfdfefcfcfdfcfffefffcfffefdfcfefffffefffcfcfdfcfcfefefefdfefd),\n.INIT_B(256'hfdfcfcfcfdfdfdfdfffcfffdfffdfcfefcfdfffdfffdfffdfdfefcfffcfffefc),\n.INIT_C(256'hfefffffefffefefffefefefefefffffffffefefefefefefffffffffffffeffff),\n.INIT_D(256'hfefffffefefffffefefefefffefffffefefefefffffefffffefefefefefffeff),\n.INIT_E(256'hfefffffefefefefefefffffffefffffefffefffffffffefefefffefffffffefe),\n.INIT_F(256'hfefefffffffefffefefefffffffefffffefffefffefffefefffffffefffeffff)\n) _bn10 (\n.RDATA(insn1[1:0]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[1:0]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefdfffefefcfdfdfcfefffffefcfcfefcfefffffcfffffdfdfcfcfdfcfffffd),\n.INIT_1(256'hfefefefffdfdfffdfcfdfdfdfefdfdfefcfefdfcfefffcfdfcfffcfcfcfefcfe),\n.INIT_2(256'hfffffdfdfefefcfdfcfcfffdfcfdfffcfdfdfdfcfcfdfefcfefcfffdfcfcfefc),\n.INIT_3(256'hfdfffdfefffefefdfffefcfffcfefefefcfcfcfffcfefcfcfffdfefefcfefcfc),\n.INIT_4(256'hfcfdfffcfefdfffdfcfdfefdfffcfffcfcfcfefdfdfcfffdfffdfcfffffdffff),\n.INIT_5(256'hfcfffefffdfcfdfffcfefdfcfdfcfffffefcfcfcfefcfffefefdfcfcfefefefd),\n.INIT_6(256'hfefcfcfefefefefcfcfefcfcfefefcfcfefcfcfefefcfdfdfdfefcfcfefcfcfd),\n.INIT_7(256'hfcfcfefefefefcfcfcfefefcfcfcfefefefcfefefefefcfefcfefefefcfcfefe),\n.INIT_8(256'hfcfefcfefefcfcfcfcfefefcfcfefcfcfefefcfefcfcfcfefcfefcfcfcfcfefe),\n.INIT_9(256'hfefdfdfefffffdfffcfefefefdfdfcfefffcfdfdfcfcfcfdfcfdfefdfcfdfcfc),\n.INIT_A(256'hfffdfcfdfcfcfdfdfefffefffcfdfffefcfdfcfffefcfdfdfdfdfefefcfdfefc),\n.INIT_B(256'hfcfdfcfcfcfcfefcfffdfefffcfefffffffdfefcfcfffdfffffffcfffffcffff),\n.INIT_C(256'hfefefffefffffffffefefefefefffefefefefffefefefefefffefffffefffefe),\n.INIT_D(256'hfefffffffffffefefefffefffffffffefffffefefefffffefefffefefffefeff),\n.INIT_E(256'hfefefefffffefffefffefffffefffefefefffffffefffefefefffffffffefffe),\n.INIT_F(256'hfefefefefefefffefffffefefefffffefffffefffefffefefffefefffefefffe)\n) _bn11 (\n.RDATA(insn1[3:2]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[3:2]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefffcfdfefefdfcfcfcfcfefffefcfcfcfcfdfffffdfcfffcfdfffcfffcfdfe),\n.INIT_1(256'hfdfcfefefefffefcfefdfefdfdfcfffefefcfcfdfdfffdfcfcfcfffefffcfcfc),\n.INIT_2(256'hfdfefcfffefcfdfcfdfffffcfcfefffffcfcfdfdfdfcfffcfefffdfcfdfcfffd),\n.INIT_3(256'hfdfcfffefdfcfcfefffefcfefcfcfffffdfdfefefffcfdfffcfffffcfcfcfefd),\n.INIT_4(256'hfdfcfffefcfcfefcfcfdfefefdfefffcfcfcfffffcfcfefdfffcfdfefffefefd),\n.INIT_5(256'hfcfdfdfcfffefdfefffcfcfcfefdfefefcfcfcfffdfefcfdfefdfcfdfcfcfefc),\n.INIT_6(256'hfefcfefefefefefefefcfefefefcfcfefefefcfcfefcfcfefefefcfefffdfdfe),\n.INIT_7(256'hfcfcfefcfcfefefefefefefcfcfefefefcfefcfcfcfcfefcfefefefefcfefefe),\n.INIT_8(256'hfdfcfefcfcfefcfcfcfcfcfefcfcfcfefefefefcfefefefefcfcfefefefcfcfe),\n.INIT_9(256'hfcfefcfdfcfefcfcfffcfcfffcfefffcfcfffcfdfcfefcfdfdfdfffcfcfefdfe),\n.INIT_A(256'hfcfefffefdfdfdfcfffefcfcfdfefdfffcfefffcfcfefdfdfcfefcfcfdfcfffe),\n.INIT_B(256'hfdfcfdfdfdfdfdfefffefcfcfdfcfcfefcfffffffffcfdfcfdfefcfcfefefefc),\n.INIT_C(256'hfffefefefefefffffffefefffffefefefffffefffefefefffffffefefefefeff),\n.INIT_D(256'hfffffffefffefffffffffffefefefefffefefefefffffffefffffffffffefffe),\n.INIT_E(256'hfffefefefefefefffffefffffefefffffffffffefefefffffefefffffffefeff),\n.INIT_F(256'hfefefffffefefefffefefefefffffffffefefefffefffefffffffffffffffffe)\n) _bn12 (\n.RDATA(insn1[5:4]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[5:4]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefefefcfefefcfdfefcfcfcfefefcfcfefcfdfdfdfdfcfefcfcfcfefcfdfcff),\n.INIT_1(256'hfcfffcfefcfefdfefcfffcfcfdfcfffcfdfffcfcfdfcfcfffdfcfcfefcfefcfc),\n.INIT_2(256'hfdfdfdfdfefefcfdfcfdfefdfcfcfcfefdfcfcfefdfefdfcfefefcfefcfcfcfd),\n.INIT_3(256'hfcfdfefdfefdfcfcfcfdfcfefcfefcfdfcfdfefefcfdfdfffffffcfdfcfcfcfd),\n.INIT_4(256'hfefdfcfffcfefffcfefdfdfefcfefcfcfefcfcfffcfefefcfffffcfefdfdfcfe),\n.INIT_5(256'hfefdfcfffcfdfcfffcfffcfcfffcfdfefefcfefcfffdfefdfefcfcfcfdfffcfd),\n.INIT_6(256'hfefcfefefefefcfefcfcfcfefcfcfcfcfcfcfcfcfefcfdfcfffdfcfcfffcfdfc),\n.INIT_7(256'hfcfcfefefcfcfefcfefcfefefcfefcfcfcfefcfcfcfcfefefefefefefcfcfcfe),\n.INIT_8(256'hfefcfcfcfdfffcfcfcfcfcfefcfcfcfcfefcfefefcfefcfefcfcfefcfefefcfe),\n.INIT_9(256'hfefcfefcfdfcfcfcfefdfcfcfcfcfcfdfdfffdfcfdfdfffcfffcfefdfdfcfcfc),\n.INIT_A(256'hfcfcfffcfcfcfcfefdfefefcfdfcfcfcfcfcfcfdfcfefcfcfdfcfcfcfefdfeff),\n.INIT_B(256'hfdfcfcfcfcfdfcfdfefffefcfefdfdfcfcfcfffefefcfefdfcfdfcfcfcfffdfc),\n.INIT_C(256'hfefffefefffefefefefffefefefffefefefffefefffffefefefefefefffffefe),\n.INIT_D(256'hfefffefffefefefffefffefffefefffefffefefefffefefffefffefffefffeff),\n.INIT_E(256'hfefffefefffffefefffffffffefefefffefffefffefefffefffffefefefffefe),\n.INIT_F(256'hfefefefffefefffffffefefffefffefefefffffefffefffffefefefffefffeff)\n) _bn13 (\n.RDATA(insn1[7:6]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[7:6]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfefcfdfefefcfefcfdfefefefffcfefdfdfffffdfefdfdfdfcfefffcfefdfd),\n.INIT_1(256'hfffdfcfdfcfcfcfefefdfcfefdfdfffefffffefcfefcfcfdfdfdfcfcfcfcfdfc),\n.INIT_2(256'hfcfefcfffcfcfcfcfcfffcfdfcfffcfcfefcfefcfffdfffcfcfcfefcfcfcfefc),\n.INIT_3(256'hfcfefefffcfcfdfffcfefdfffcfefcfffcfffcfdfcfcfcfdfcfdfcfefcfefcfc),\n.INIT_4(256'hfcfcfdfcfdfcfcfcfcfdfdfdfcfcfcfefdfcfcfcfcfdfdfdfcfcfcfffcfcfcff),\n.INIT_5(256'hfcfdfcfffcfcfcfefdfffffffefcfefcfefcfefcfefcfcfcfefcfefffffcfcff),\n.INIT_6(256'hfcfcfcfcfefefcfcfcfcfcfefcfcfcfefefefcfcfcfcfcfefcfcfdfffcfcfdff),\n.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfcfcfefcfefcfcfcfcfcfefcfcfcfcfefefcfefcfe),\n.INIT_8(256'hfcfcfdfffcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfcfefcfcfcfcfe),\n.INIT_9(256'hfdfffcfdfefefcfdfcfcfdfffcfffcfefcfcfcfcfdfdfcfcfcfcfcfdfdfffcfe),\n.INIT_A(256'hfcfffdfffdfefcfcfdfdfdfcfdfffdfefcfefcfefdfdfcfdfcfcfcfefcfcffff),\n.INIT_B(256'hfdfdfdfcfcfdfcfffefefcfffcfdfefefdfffffefcfffdfcfefefcfdfcfdfcfc),\n.INIT_C(256'hfffefffffefffefefefffefefefefefefefffefffefefefefefefefffefefeff),\n.INIT_D(256'hfefefefefefffefffffffffffffefefffefefefefefefefffefefefffffefeff),\n.INIT_E(256'hfffefefffefffefffffefefffefefefefefffffefffffefffefefefefefffeff),\n.INIT_F(256'hfefefefefefffefffefefffffefffffffefefffffffffffefffffefffefefeff)\n) _bn14 (\n.RDATA(insn1[9:8]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[9:8]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfcfcfdfdfcfefdfdfffefcfcfdfffcfdfffffdfcfdfdfefcfcfcfefcfcfdff),\n.INIT_1(256'hfdfffcfcfcfcfcfefcfcfffefefefcfcfcfefffefcfcfcfcfcfcfcfcfcfeffff),\n.INIT_2(256'hfcfdfcfefcfefcfcfcfffcfdfcfffcfefefefcfdfcfcfdfcfffcfcfdfefefcfd),\n.INIT_3(256'hfcfcfdfcfcfdfcfffefcfcfcfcfcfefdfcfefcfffcfcfefcfcfcfefdfcfefcfc),\n.INIT_4(256'hfcfcfdfdfcfdfcfcfcfcfcfcfcfcfefcfdfdfcfcfcfdfdfcfcfffcfcfcfdfcff),\n.INIT_5(256'hfcfdfdfdfdfdfcfefdfffdfcfcfcfcfcfcfcfcfcfcfcfdfcfcfcfefffcfcfefc),\n.INIT_6(256'hfcfcfcfefefefcfcfcfcfefcfcfcfcfefcfefcfcfcfcfcfefcfcfdfffcfcfcfe),\n.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfefefcfcfefcfcfcfcfcfefcfefcfefefefcfefefc),\n.INIT_8(256'hfcfcfcfcfcfefcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefefcfefcfcfcfcfefc),\n.INIT_9(256'hfefcfcfefefcfcfdfdfcfcfcfcfffdfcfcfefdfcfcfcfdfcfcfcfcfcfcfefcfe),\n.INIT_A(256'hfcfffefcfdfefefdfcfcfdfcfcfefdfcfcfefcfcfdfffcfcfcfcfcfefcfcfcfc),\n.INIT_B(256'hfcfcfdfcfcfdfcfefcfdfefdfcfefefcfdfefcfdfefcfcfffefdfcfdfcfcfcfc),\n.INIT_C(256'hfefffefefefefefefefefefefffefffefefefefffffefefefefffefffffefeff),\n.INIT_D(256'hfefffefefffefefffffffefefefefefefefefefefefefefefefefeffffffffff),\n.INIT_E(256'hfefefffffefefefffefefefefefefefffefffffffefefefefefefefefefefeff),\n.INIT_F(256'hfefefefefffffefefefefefefefefefefefffefefefefefffefefefefefefeff)\n) _bn15 (\n.RDATA(insn1[11:10]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[11:10]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfffefcfcfcfffcfdfcfefdfcfcfefcfdfcfefcfefcfdfcfcfcfdfefefcfdfc),\n.INIT_1(256'hfdfcfdfcfefdfffcfefefefcfefefcfcfefefffcfcfefcfcfcfcfcfcfefcfffc),\n.INIT_2(256'hfcfcfcfcfdfcfcfcfdfcfdfdfdfdfefffffcfcfefcfefcfefcfcfcfefefefdff),\n.INIT_3(256'hfefcfdfcfffdfdfdfcfdfcfcfcfcfffcfdfcfdfcfcfdfcfcfcfcfffcfdfdfcfd),\n.INIT_4(256'hfcfcfdfcfdfcfcfdfcfcfcfcfcfcfcfcfdfcfcfdfcfcfdfcfcfcfdfcfefcfefe),\n.INIT_5(256'hfcfcfcfdfdfcfdfdfffcfefffcfffdfefcfefcfefcfefffcfcfefcfefcfefcfc),\n.INIT_6(256'hfcfcfcfcfefefcfcfcfcfefcfcfcfcfcfcfcfcfcfcfcfdfcfcfdfcfdfcfdfcfc),\n.INIT_7(256'hfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfc),\n.INIT_8(256'hfcfcfffdfcfdfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfefcfcfefcfcfefc),\n.INIT_9(256'hfffcfcfdfffcfcfcfcfcfcfcfcfcfefcfcfcfcfcfcfcfdfcfcfcfcfcfcfcfcfc),\n.INIT_A(256'hfcfcfefcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfdfcfcfdfdfcfcfcfcfcfdfd),\n.INIT_B(256'hfcfcfcfcfdfcfdfcfdfcfffcfcfdfffcfdfcfcfcfffcfdfcfffcfdfcfcfdfdfc),\n.INIT_C(256'hfffffffffefffefefefefefefffffffefefffefefefefefefefefefefffefefe),\n.INIT_D(256'hfffffffffffefffefffefffffffffefffffefefefefefefefefefffffffefffe),\n.INIT_E(256'hfffffffefefffefefefefefefefefffffffefffefffefefffefefefefefefefe),\n.INIT_F(256'hfefefefefffefefffffefefefefefefefefefefefefefefefefefefefefefffe)\n) _bn16 (\n.RDATA(insn1[13:12]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[13:12]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfcfcfefcfffcfdfcfffcfefcfefcfdfcfefcfefcfefcfffefdfefdfcfefcff),\n.INIT_1(256'hfcfdfcfdfcfcfcfffcfffcfefcfffdfefcfffcfefcfdfcfdfefdfdfcfcfefcfe),\n.INIT_2(256'hfcfefcfffdfefefcfcfffcfffcfffcfefcfdfcfdfcfdfdfcfcfdfefdfcfefcfd),\n.INIT_3(256'hfcfefcfffcfffcfffcfcfcfefdfefcfdfcfffcfffcfefcfefcfffcfdfcfffefc),\n.INIT_4(256'hfcfefcfffefdfcfcfcfefcfffffcfcfcfcfefcfefefcfcfdfcfffcfffcfdfcff),\n.INIT_5(256'hfcfffcfffefdfcfffcfffcfffcfcfcfdfdfcfcfdfcfdfcfefefdfcfffcfdfcfd),\n.INIT_6(256'hfcfefcfefefefcfefefcfcfcfcfefcfefcfefefcfcfefcfffdfefcfffcfefcfe),\n.INIT_7(256'hfcfefcfefcfefcfefcfefcfefcfefcfefcfefefcfcfefcfefcfefefcfcfefcfc),\n.INIT_8(256'hfcfefcfffcfefefcfcfefcfefefcfcfefcfcfcfefcfcfcfefcfefcfcfcfcfcfc),\n.INIT_9(256'hfcfdfcfefcfffcfffcfffcfffcfffcfffcfffefcfefdfcfefcfffcfffcfffdfe),\n.INIT_A(256'hfcfffcfdfdfefcfffefdfdfefcfffdfefcfffcfefcfffefcfefdfdfefcfefcff),\n.INIT_B(256'hfcfdfdfcfcfdfcfdfcfffcfdfcfefcfffcfffcfffcfdfcfffcfffcfffcfefefd),\n.INIT_C(256'hfefffefffefefefefefffffefefffefffefefefefefefefffefffefffefefeff),\n.INIT_D(256'hfefffefffefffefffefffefffefffefefefffffefefffefffefefefffefffefe),\n.INIT_E(256'hfefffefffefefefefefffffefefffefffefffefffefffefefefefefffefffeff),\n.INIT_F(256'hfffefefefefffefefefffefffefffefffefffefffefffefffefffefffefefeff)\n) _bn17 (\n.RDATA(insn1[15:14]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[15:14]));\n\n\nreg c11;\nalways @(posedge clk)\n  c11 <= code_addr[11];\n\nassign insn = c11 ? insn1 : insn0;\n*/\n",
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
                  "name": "unlocked"
                },
                {
                  "name": "dout",
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
            "x": 120,
            "y": 776
          },
          "size": {
            "width": 464,
            "height": 280
          }
        },
        {
          "id": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
          "type": "basic.code",
          "data": {
            "code": "// @include j1.v\n\n// @include stack2.v\n// @include nuc.list\n\n   localparam MHZ = 12;\n\n//-- Señales añadidas\nassign do = dout;\nassign w4_o = w4;\nassign mem_addr_o = mem_addr;\nassign code_addr_o = code_addr;\nassign mem_wr_o = mem_wr;\nassign dout_o = dout;\nassign unlocked_o = unlocked;\n\nwire [15:0] dout;\n wire io_rd, io_wr;\n  wire [15:0] mem_addr;\n  wire mem_wr;\n  wire [15:0] io_din;\n  wire [12:0] code_addr;\n  reg unlocked = 0;\n\n  j1 _j1(\n    .clk(clk),\n    .resetq(resetq),\n    .io_rd(io_rd),    //-- output\n    .io_wr(io_wr),    //-- output\n    .mem_wr(mem_wr),  //-- output\n    .dout(dout),      //-- output\n    .io_din(io_din),  //-- input\n    .mem_addr(mem_addr),  //-- output\n    .code_addr(code_addr), //-- output (13 bits)\n    .insn(insn));          //-- input\n\n  // ######   IO SIGNALS   ####################################\n\n\twire io_wr_ = io_wr, io_rd_ = io_rd;\n\twire [15:0] dout_ = dout; //--\n\twire [15:0] io_addr_ = mem_addr;\n\n\n  // ######   UART   ##########################################\n  \n  assign uart0_wr = io_wr_ & io_addr_[12];\n  assign uart0_rd = io_rd_ & io_addr_[12];\n\n\n  wire [4:0] LEDS;\n  wire w4 = io_wr_ & io_addr_[2];\n\n  assign io_din =\n    (io_addr_[12] ? {8'd0, uart0_data}                                  : 16'd0) |\n    (io_addr_[13] ? {11'd0, 1'b1, 1'b1, 1'b1, uart0_valid, !uart0_busy} : 16'd0);\n\n\n\n  always @(posedge clk)\n    if (!resetq)\n      unlocked <= 0;\n    else\n      unlocked <= unlocked | io_wr_;\n\n\n\n\n",
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
                  "name": "uart0_valid"
                },
                {
                  "name": "uart0_busy"
                },
                {
                  "name": "uart0_data",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "insn",
                  "range": "[15:0]",
                  "size": 16
                }
              ],
              "out": [
                {
                  "name": "do",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "w4_o"
                },
                {
                  "name": "uart0_rd"
                },
                {
                  "name": "uart0_wr"
                },
                {
                  "name": "mem_addr_o",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "code_addr_o",
                  "range": "[12:0]",
                  "size": 13
                },
                {
                  "name": "mem_wr_o"
                },
                {
                  "name": "dout_o",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "unlocked_o"
                }
              ]
            }
          },
          "position": {
            "x": 248,
            "y": 64
          },
          "size": {
            "width": 504,
            "height": 552
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "uart0_rd"
          },
          "target": {
            "block": "420cb073-0164-4994-aff2-52ccecf1e1a3",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "e9ee0c57-2054-4b22-ba37-8e3824b76a2d",
            "port": "outlabel"
          },
          "target": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "uart0_rd"
          }
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "uart0_wr"
          },
          "target": {
            "block": "0b755e68-ff16-425a-aae3-f3fea766e8d4",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "11127019-1657-4653-bb9e-05d1d37070cc",
            "port": "outlabel"
          },
          "target": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "uart0_wr"
          }
        },
        {
          "source": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "uart0_valid"
          },
          "target": {
            "block": "134bee0f-d49e-44a5-b516-136280140b10",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "ba1e3f74-8fb7-4864-8f22-cd1ba63309fe",
            "port": "outlabel"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "uart0_valid"
          }
        },
        {
          "source": {
            "block": "9373440c-282f-4ca8-afc0-1434cbe7fc34",
            "port": "outlabel"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "uart0_busy"
          }
        },
        {
          "source": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "uart0_busy"
          },
          "target": {
            "block": "77843c85-5ae4-4331-a590-0e7e2bc3a432",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "4cda24d4-a3c1-49b8-a0b9-98339e420700",
            "port": "outlabel"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "uart0_data",
            "size": 8
          },
          "size": 8
        },
        {
          "source": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "uart0_data",
            "size": 8
          },
          "target": {
            "block": "68883952-c3b3-486d-8a09-8ad2e20c8625",
            "port": "inlabel"
          },
          "size": 8
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "do",
            "size": 8
          },
          "target": {
            "block": "d3703daa-73b8-41a1-8f96-9e118d401a9f",
            "port": "inlabel"
          },
          "size": 8
        },
        {
          "source": {
            "block": "5635b99e-3fef-4b0a-a9fc-806edad7b076",
            "port": "outlabel"
          },
          "target": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "dout_",
            "size": 8
          },
          "size": 8
        },
        {
          "source": {
            "block": "a442e1e3-49a1-4b50-af0f-65530888fd8c",
            "port": "outlabel"
          },
          "target": {
            "block": "69f24903-e5b6-43d9-8bfc-909949fc0d73",
            "port": "dout",
            "size": 8
          },
          "size": 8
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "w4_o"
          },
          "target": {
            "block": "5295e5c1-0bf9-461f-a8e4-4fdf586c1f6f",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "0ec733b1-535c-40d0-b802-7cdb57136885",
            "port": "outlabel"
          },
          "target": {
            "block": "69f24903-e5b6-43d9-8bfc-909949fc0d73",
            "port": "w4"
          }
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "mem_addr_o",
            "size": 16
          },
          "target": {
            "block": "28867e8d-be43-4edc-b0d9-ab13ffb974e6",
            "port": "inlabel"
          },
          "size": 16
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "code_addr_o",
            "size": 13
          },
          "target": {
            "block": "06c4daac-b4e1-4e2f-8f77-ff04f6036b93",
            "port": "inlabel"
          },
          "size": 13
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "dout_o",
            "size": 16
          },
          "target": {
            "block": "a6c3ecc6-1806-4869-b4d5-48c0a222a290",
            "port": "inlabel"
          },
          "size": 16
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "unlocked_o"
          },
          "target": {
            "block": "a2da3af8-2e41-42c8-b09b-ca94fe19cff4",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "mem_wr_o"
          },
          "target": {
            "block": "2311157e-f95a-45f1-b0f3-fae6327d511b",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "7d973072-fdc4-4bd9-bba2-4f7354223963",
            "port": "outlabel"
          },
          "target": {
            "block": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
            "port": "mem_addr",
            "size": 16
          },
          "size": 16
        },
        {
          "source": {
            "block": "7b8177f3-a664-4971-8f1f-daf748b0dd9e",
            "port": "outlabel"
          },
          "target": {
            "block": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
            "port": "code_addr",
            "size": 13
          },
          "size": 13
        },
        {
          "source": {
            "block": "a19ecd0a-edfb-456d-a814-d21b8891dfcf",
            "port": "outlabel"
          },
          "target": {
            "block": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
            "port": "dout",
            "size": 16
          },
          "size": 16
        },
        {
          "source": {
            "block": "84935129-b4ae-4a7a-bc58-637987780743",
            "port": "outlabel"
          },
          "target": {
            "block": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
            "port": "mem_wr"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "61472292-3ce5-4a8e-aff3-2640eba07498",
            "port": "outlabel"
          },
          "target": {
            "block": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
            "port": "unlocked"
          }
        },
        {
          "source": {
            "block": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
            "port": "insn",
            "size": 16
          },
          "target": {
            "block": "b4159c03-d0d1-4464-b55c-2e2af3b3cf6f",
            "port": "inlabel"
          },
          "size": 16
        },
        {
          "source": {
            "block": "cfd3dfc6-c268-4a23-9e33-0b04a68508a7",
            "port": "outlabel"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "insn",
            "size": 16
          },
          "size": 16
        },
        {
          "source": {
            "block": "69f24903-e5b6-43d9-8bfc-909949fc0d73",
            "port": "port"
          },
          "target": {
            "block": "474f9a61-9b0b-45a7-8ac1-13757b0a9153",
            "port": "in"
          },
          "size": 5
        },
        {
          "source": {
            "block": "65e5ed38-6c4c-4aab-8069-c328e953e98c",
            "port": "out"
          },
          "target": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "uart_RXD"
          }
        },
        {
          "source": {
            "block": "c3c2baef-792a-4df9-a9a7-832e41a43a84",
            "port": "TX"
          },
          "target": {
            "block": "51ffc131-a0be-4402-8d8a-d493aa097f71",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "f68cb39c-4a93-47c5-9073-253f0cee0917",
            "port": "dde18e55-7d08-438f-a248-5f1d0c050689"
          },
          "target": {
            "block": "e40e4536-5f7b-466d-bddf-4aac29652ef3",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "e40e4536-5f7b-466d-bddf-4aac29652ef3",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "resetq"
          }
        },
        {
          "source": {
            "block": "b09be0dc-b4ab-4c33-9b1d-7a7a1f2f097e",
            "port": "constant-out"
          },
          "target": {
            "block": "e69a332a-f12a-4bcc-a832-c6e223c65ecd",
            "port": "PROG"
          }
        }
      ]
    }
  },
  "dependencies": {
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
    }
  }
}