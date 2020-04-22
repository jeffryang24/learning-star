import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import 'rxjs/add/operator/toPromise';

import { Customer } from '../models/Customer';

@Injectable()
export class DataService {

  private customersUrl = 'http://localhost:9090';
  private headers = new Headers({'Content-Type': 'application/json'});

  constructor(private http: Http) {}

  getCustomers(): Promise<Customer[]> {
    return this.http.get(this.customersUrl + '/customer')
      .toPromise()
      .then(resp => resp.json() as Customer[])
      .catch(this.handleError);
  }

  getCustomersByLastName(lastName: string): Promise<Customer[]> {
    return this.http.get(this.customersUrl + `/findbylastname/${lastName}`)
      .toPromise()
      .then(resp => resp.json() as Customer[])
      .catch(this.handleError);
  }

  createCustomer(data: Customer): Promise<Customer> {
    return this.http.post(this.customersUrl + '/postcustomer', JSON.stringify(data), { headers: this.headers })
      .toPromise()
      .then(resp => resp.json() as Customer)
      .catch(this.handleError);
  }

  deleteCustomer(id: number): Promise<void> {
    return this.http.delete(`${this.customersUrl}/customer/${id}`, { headers: this.headers })
      .toPromise()
      .then(() => null)
      .catch(this.handleError);
  }

  private handleError(error: any): Promise<any> {
    console.error('Error', error);
    return Promise.reject(error.message || error);
  }
}
