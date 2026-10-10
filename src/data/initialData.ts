import { Brand, Category, Product, City, User, CheckoutOrder } from '../types';

export const initialBrands: Brand[] = [
  { BrandID: 1, Name: 'Rolex', Description: 'High-end Swiss luxury watches.', Image: '/assets/icons/brands/rolex.jpg' },
  { BrandID: 2, Name: 'Casio', Description: 'Affordable and durable watches.', Image: '/assets/icons/brands/Casio.png' },
  { BrandID: 3, Name: 'Omega', Description: 'Luxury watches with timeless designs.', Image: '/assets/icons/brands/Omega.png' },
  { BrandID: 4, Name: 'Fossil', Description: 'Trendy and stylish watches.', Image: '/assets/icons/brands/Fossil.jpg' },
  { BrandID: 5, Name: 'Seiko', Description: 'Precision-engineered Japanese watches.', Image: '/assets/icons/brands/Seiko.jpg' },
];

export const initialCategories: Category[] = [
  { CatID: 1, Name: 'Men', Description: 'Watches designed for men', Image: '/assets/images/categories/men-watch.jpg' },
  { CatID: 2, Name: 'Women', Description: 'Watches designed for women', Image: '/assets/images/categories/women-watch.png' },
  { CatID: 3, Name: 'Boy', Description: 'Watches designed for boys', Image: '/assets/images/categories/boy-watch.jpg' },
  { CatID: 4, Name: 'Girl', Description: 'Watches designed for girls', Image: '/assets/images/categories/girl-watch.jpg' },
];

export const initialProducts: Product[] = [
  { ProductID: 1, Title: 'Rolex Submariner', Description: 'Iconic luxury diving watch for men.', Image: '/assets/images/shop/product/1.jpg', Price: 800000, Quantity: 5, CategoryID: 1, BrandID: 1 },
  { ProductID: 2, Title: 'Rolex Daytona', Description: 'Chronograph luxury watch with tachymetric scale.', Image: '/assets/images/shop/product/2.jpg', Price: 850000, Quantity: 5, CategoryID: 1, BrandID: 1 },
  { ProductID: 3, Title: 'Casio G-Shock', Description: 'Durable and rugged digital shock-resistant watch.', Image: '/assets/images/shop/product/3.jpg', Price: 20000, Quantity: 10, CategoryID: 1, BrandID: 2 },
  { ProductID: 4, Title: 'Casio Edifice', Description: 'Sophisticated analog-digital watch with speed indicator.', Image: '/assets/images/shop/product/4.jpg', Price: 25000, Quantity: 10, CategoryID: 1, BrandID: 2 },
  { ProductID: 5, Title: 'Omega Seamaster', Description: 'Luxury diving watch celebrated for oceanic heritage.', Image: '/assets/images/shop/product/5.jpg', Price: 700000, Quantity: 5, CategoryID: 1, BrandID: 3 },
  { ProductID: 6, Title: 'Omega Speedmaster', Description: 'Iconic chronograph watch tested on lunar missions.', Image: '/assets/images/shop/product/6.jpg', Price: 750000, Quantity: 5, CategoryID: 1, BrandID: 3 },
  { ProductID: 7, Title: 'Fossil Gen 5', Description: 'Trendy smartwatch for men with fitness tracking.', Image: '/assets/images/shop/product/7.jpg', Price: 30000, Quantity: 25, CategoryID: 1, BrandID: 4 },
  { ProductID: 8, Title: 'Fossil Nate', Description: 'Rugged men’s chronograph watch with matte black dial.', Image: '/assets/images/shop/product/8.jpg', Price: 35000, Quantity: 20, CategoryID: 1, BrandID: 4 },
  { ProductID: 9, Title: 'Seiko 5', Description: 'Automatic watch for men with day-date display.', Image: '/assets/images/shop/product/9.jpg', Price: 40000, Quantity: 15, CategoryID: 1, BrandID: 5 },
  { ProductID: 10, Title: 'Seiko Presage', Description: 'Elegant men’s mechanical watch with artisanal dial.', Image: '/assets/images/shop/product/10.jpg', Price: 50000, Quantity: 12, CategoryID: 1, BrandID: 5 },
  { ProductID: 11, Title: 'Rolex Lady-Datejust', Description: 'Elegant luxury watch for women with Oyster architecture.', Image: '/assets/images/shop/product/11.jpg', Price: 700000, Quantity: 5, CategoryID: 2, BrandID: 1 },
  { ProductID: 12, Title: 'Rolex Pearlmaster', Description: 'High-end luxury watch for women set with gems.', Image: '/assets/images/shop/product/12.jpg', Price: 900000, Quantity: 4, CategoryID: 2, BrandID: 1 },
  { ProductID: 13, Title: 'Casio Baby-G', Description: 'Stylish and durable watch for active women.', Image: '/assets/images/shop/product/13.jpg', Price: 15000, Quantity: 12, CategoryID: 2, BrandID: 2 },
  { ProductID: 14, Title: 'Casio Sheen', Description: 'Sophisticated analog watch for women with crystal bezels.', Image: '/assets/images/shop/product/14.jpg', Price: 25000, Quantity: 8, CategoryID: 2, BrandID: 2 },
  { ProductID: 15, Title: 'Omega De Ville', Description: 'Luxury watch with a classic slender look for women.', Image: '/assets/images/shop/product/15.jpg', Price: 750000, Quantity: 6, CategoryID: 2, BrandID: 3 },
  { ProductID: 16, Title: 'Omega Constellation', Description: 'Luxury ladies watch with iconic claws and diamond accents.', Image: '/assets/images/shop/product/16.jpg', Price: 800000, Quantity: 5, CategoryID: 2, BrandID: 3 },
  { ProductID: 17, Title: 'Fossil Jacqueline', Description: 'Chic and elegant leather strap watch for women.', Image: '/assets/images/shop/product/17.jpg', Price: 15000, Quantity: 20, CategoryID: 2, BrandID: 4 },
  { ProductID: 18, Title: 'Fossil Riley', Description: 'Stylish women’s multifunction watch with polished steel finish.', Image: '/assets/images/shop/product/18.jpg', Price: 18000, Quantity: 18, CategoryID: 2, BrandID: 4 },
  { ProductID: 19, Title: 'Seiko Presage Cocktail Time', Description: 'Elegant women’s watch with cocktail-inspired sunburst dial.', Image: '/assets/images/shop/product/19.jpg', Price: 55000, Quantity: 10, CategoryID: 2, BrandID: 5 },
  { ProductID: 20, Title: 'Seiko Solar', Description: 'Eco-friendly solar-powered women’s watch.', Image: '/assets/images/shop/product/20.jpg', Price: 35000, Quantity: 14, CategoryID: 2, BrandID: 5 },
  { ProductID: 21, Title: 'Rolex Girl Datejust', Description: 'Elegant luxury watch for young women and girls.', Image: '/assets/images/shop/product/21.jpg', Price: 650000, Quantity: 5, CategoryID: 4, BrandID: 1 },
  { ProductID: 22, Title: 'Rolex Girl Oyster Perpetual', Description: 'High-end luxury watch with vibrant candy dial.', Image: '/assets/images/shop/product/22.jpg', Price: 700000, Quantity: 4, CategoryID: 4, BrandID: 1 },
  { ProductID: 23, Title: 'Casio F91W-1', Description: 'Simple, lightweight, and durable digital watch.', Image: '/assets/images/shop/product/23.jpg', Price: 5000, Quantity: 15, CategoryID: 4, BrandID: 2 },
  { ProductID: 24, Title: 'Casio Baby-G BG169R', Description: 'Sporty and water-resistant durable watch for girls.', Image: '/assets/images/shop/product/24.jpg', Price: 8000, Quantity: 10, CategoryID: 4, BrandID: 2 },
  { ProductID: 25, Title: 'Omega Swatch MoonSwatch', Description: 'Playful bioceramic planetary tribute edition.', Image: '/assets/images/shop/product/25.jpg', Price: 80000, Quantity: 6, CategoryID: 4, BrandID: 3 },
  { ProductID: 26, Title: 'Omega De Ville Prestige', Description: 'Sophisticated Roman numeral design for teens.', Image: '/assets/images/shop/product/26.jpg', Price: 750000, Quantity: 5, CategoryID: 4, BrandID: 3 },
  { ProductID: 27, Title: 'Fossil Minimalist', Description: 'Stylish and minimalist slim watch for girls.', Image: '/assets/images/shop/product/27.jpg', Price: 12000, Quantity: 18, CategoryID: 4, BrandID: 4 },
  { ProductID: 28, Title: 'Fossil Vintage Glam', Description: 'Vintage glam watch with a chic rose-tone look.', Image: '/assets/images/shop/product/28.jpg', Price: 15000, Quantity: 20, CategoryID: 4, BrandID: 4 },
  { ProductID: 29, Title: 'Seiko 5 Women’s', Description: 'Classic automatic watch with stainless steel bracelet.', Image: '/assets/images/shop/product/29.jpg', Price: 25000, Quantity: 10, CategoryID: 4, BrandID: 5 },
  { ProductID: 30, Title: 'Seiko Solar Femme', Description: 'Eco-friendly solar-powered slim watch for girls.', Image: '/assets/images/shop/product/30.jpg', Price: 30000, Quantity: 8, CategoryID: 4, BrandID: 5 },
  { ProductID: 31, Title: 'Rolex Oyster Perpetual Boys', Description: 'Classic luxury stainless steel watch for young men.', Image: '/assets/images/shop/product/31.jpg', Price: 650000, Quantity: 6, CategoryID: 3, BrandID: 1 },
  { ProductID: 32, Title: 'Rolex Explorer Boys', Description: 'Adventure-ready luxury tool watch with luminous hands.', Image: '/assets/images/shop/product/32.jpg', Price: 700000, Quantity: 5, CategoryID: 3, BrandID: 1 },
  { ProductID: 33, Title: 'Casio G-Shock Boys', Description: 'Rugged and durable military-inspired watch.', Image: '/assets/images/shop/product/33.jpg', Price: 8000, Quantity: 18, CategoryID: 3, BrandID: 2 },
  { ProductID: 34, Title: 'Casio F91W Boys', Description: 'Simple, lightweight everyday digital classic.', Image: '/assets/images/shop/product/34.jpg', Price: 6000, Quantity: 15, CategoryID: 3, BrandID: 2 },
  { ProductID: 35, Title: 'Omega Seamaster Boys', Description: 'Compact luxury diving watch for junior collectors.', Image: '/assets/images/shop/product/35.jpg', Price: 750000, Quantity: 5, CategoryID: 3, BrandID: 3 },
  { ProductID: 36, Title: 'Omega Speedmaster Boys', Description: 'Legendary chronograph in mid-size case.', Image: '/assets/images/shop/product/36.jpg', Price: 800000, Quantity: 4, CategoryID: 3, BrandID: 3 },
  { ProductID: 37, Title: 'Fossil Boys Gen 5', Description: 'Stylish touch-screen smartwatch with customizable dials.', Image: '/assets/images/shop/product/37.jpg', Price: 25000, Quantity: 20, CategoryID: 3, BrandID: 4 },
  { ProductID: 38, Title: 'Fossil Boys Nate', Description: 'Rugged watch with genuine leather strap.', Image: '/assets/images/shop/product/38.jpg', Price: 18000, Quantity: 25, CategoryID: 3, BrandID: 4 },
  { ProductID: 39, Title: 'Seiko 5 Boys', Description: 'Reliable and durable automatic caliber with exhibition back.', Image: '/assets/images/shop/product/39.jpg', Price: 25000, Quantity: 12, CategoryID: 3, BrandID: 5 },
  { ProductID: 40, Title: 'Seiko Presage Boys', Description: 'Elegant boys’ watch with a refined Japanese enamel dial.', Image: '/assets/images/shop/product/40.jpg', Price: 35000, Quantity: 10, CategoryID: 3, BrandID: 5 }
];

export const initialCities: City[] = [
  { id: 1, name: 'Karachi' },
  { id: 2, name: 'Lahore' },
  { id: 3, name: 'Islamabad' },
  { id: 4, name: 'Rawalpindi' },
  { id: 5, name: 'Faisalabad' },
];

export const initialUsers: User[] = [
  { UserID: 1, Username: 'zeeshan', Email: 'Zeeahmed2001@gmail.com', Role: 'user', Password: 'password123' },
  { UserID: 11, Username: 'Zeeshan', Email: 'wangahmed01@gmail.com', Role: 'admin', Password: 'password123' },
  { UserID: 12, Username: 'admin2', Email: 'admin2@example.com', Role: 'admin', Password: 'password123' }
];

export const sliderImages: string[] = [
  '/assets/images/slider/1.jpg',
  '/assets/images/slider/2.jpg',
  '/assets/images/slider/3.jpg',
  '/assets/images/slider/4.jpg',
  '/assets/images/slider/5.jpg',
  '/assets/images/slider/6.jpg',
  '/assets/images/slider/7.jpg'
];

export const initialOrders: CheckoutOrder[] = [
  {
    CheckoutID: 101,
    UserID: 1,
    Username: 'zeeshan',
    Phone: '+92 300 1234567',
    Address: 'Gulshan-e-Iqbal Block 5',
    City: 'Karachi',
    Gender: 'Male',
    PaymentMethod: 'Visa',
    TotalAmount: 20000,
    Items: [
      {
        ProductID: 3,
        Title: 'Casio G-Shock',
        Price: 20000,
        Quantity: 1,
        Image: '/assets/images/shop/product/3.jpg'
      }
    ],
    PaymentStatus: 'Completed',
    CheckoutTimestamp: '2024-11-18 10:30:00'
  }
];
