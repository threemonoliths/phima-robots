import { Injectable } from '@angular/core';
import { SmartTableData } from '../data/smart-table';


@Injectable()
export class SmartTableService extends SmartTableData {

  data = [{
    id: 1,
    robIP: '192.168.0.100',
    robotName: 'Otto',
  }, {
    id: 2,
    robIP: '192.168.0.101',
    robotName: 'Thornton',
  }, {
    id: 3,
    robIP: '192.168.0.102',
    robotName: 'Bird',
  }, {
    id: 4,
    robIP: '192.168.0.102',
    robotName: 'Snow',
  }, {
    id: 5,
    robIP: '192.168.0.103',
    robotName: 'Sparrow',
  }, {
    id: 6,
    robIP: '192.168.0.104',
    robotName: 'Smith',
  }, {
    id: 7,
    robIP: '192.168.0.105',
    robotName: 'Black',
  }, {
    id: 8,
    robIP: '192.168.0.106',
    robotName: 'Bagrat',
  }, {
    id: 9,
    robIP: '192.168.0.107',
    robotName: 'Vardan',
  }, {
    id: 10,
    robIP: '192.168.0.108',
    robotName: 'Sevan',
  }, {
    id: 11,
    robIP: '192.168.0.109',
    robotName: 'Otto',
  }, {
    id: 12,
    robIP: '192.168.0.110',
    robotName: 'Thornton',
  }, {
    id: 13,
    robIP: '192.168.0.111',
    robotName: 'Hakob',
  }, {
    id: 14,
    robIP: '192.168.0.112',
    robotName: 'Jirair',
  }, {
    id: 15,
    robIP: '192.168.0.113',
    robotName: 'Bedros',
  }, 
];

  getData() {
    return this.data;
  }
}
