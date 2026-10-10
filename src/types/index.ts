export interface Brand {
  BrandID: number;
  Name: string;
  Description: string;
  Image: string;
}

export interface Category {
  CatID: number;
  Name: string;
  Description: string;
  Image: string;
}

export interface Product {
  ProductID: number;
  Title: string;
  Description: string;
  Image: string;
  Price: number;
  Quantity: number;
  CategoryID: number;
  BrandID: number;
  CreatedAt?: string;
}

export interface User {
  UserID: number;
  Username: string;
  Email: string;
  Role: 'admin' | 'user';
  Password?: string;
  Image?: string | null;
}

export interface CartItem {
  ProductID: number;
  Title: string;
  Price: number;
  Quantity: number;
  Image: string;
}

export interface CheckoutOrder {
  CheckoutID: number;
  UserID: number;
  Username: string;
  Phone: string;
  Address: string;
  City: string;
  Gender: 'Male' | 'FeMale';
  PaymentMethod: string;
  TotalAmount: number;
  Items: CartItem[];
  PaymentStatus: 'Pending' | 'Completed' | 'Failed';
  CheckoutTimestamp: string;
}

export interface Review {
  ReviewID: number;
  ProductID: number;
  UserID: number;
  Username: string;
  Rating: number;
  Comment: string;
  CreatedAt: string;
}

export interface City {
  id: number;
  name: string;
}
