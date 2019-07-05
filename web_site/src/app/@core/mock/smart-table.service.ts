import { Injectable } from '@angular/core';
import { SmartTableData } from '../data/smart-table';

@Injectable()
export class SmartTableService extends SmartTableData {

  data = [{
    id: 1,
    robIP: 'Mark',
    robotName: 'Otto',
  }, {
    id: 2,
    robIP: 'Jacob',
    robotName: 'Thornton',
  }, {
    id: 3,
    robIP: 'Larry',
    robotName: 'Bird',
  }, {
    id: 4,
    firstName: 'John',
    robotName: 'Snow',
  }, {
    id: 5,
    firstName: 'Jack',
    robotName: 'Sparrow',
  }, {
    id: 6,
    firstName: 'Ann',
    robotName: 'Smith',
  }, {
    id: 7,
    firstName: 'Barbara',
    robotName: 'Black',
  }, {
    id: 8,
    firstName: 'Sevan',
    robotName: 'Bagrat',
  }, {
    id: 9,
    firstName: 'Ruben',
    robotName: 'Vardan',
  }, {
    id: 10,
    firstName: 'Karen',
    robotName: 'Sevan',
  }, {
    id: 11,
    firstName: 'Mark',
    robotName: 'Otto',
  }, {
    id: 12,
    firstName: 'Jacob',
    robotName: 'Thornton',
  }, {
    id: 13,
    firstName: 'Haik',
    robotName: 'Hakob',
  }, {
    id: 14,
    firstName: 'Garegin',
    robotName: 'Jirair',
  }, {
    id: 15,
    firstName: 'Krikor',
    robotName: 'Bedros',
  }, 
];

  getData() {
    return this.data;
  }
}
