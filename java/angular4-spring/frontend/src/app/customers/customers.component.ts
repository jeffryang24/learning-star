import { Component, OnInit } from '@angular/core';
import { Customer } from '../models/Customer';
import { DataService } from '../services/DataService';

@Component({
  selector: 'app-customers',
  templateUrl: './customers.component.html',
  styleUrls: ['./customers.component.css']
})
export class CustomersComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
