### Updated Conceptual Model (MCD) for Tontine Application

#### Entities and Relationships

1. **User**
   - Identified by their phone number.
   - Can be a member of multiple associations.
   - Can be an admin in multiple associations.
   - Can belong to one or more tontines within an association.
   - Attributes:
     - `id` (Primary Key)
     - `phone_number`
     - `name`
     - `associations` (List of associations the user is part of)
     - `roles` (Role of the user in each association: admin or member)

2. **Association**
   - Can have multiple tontines.
   - Has members (users).
   - Has meeting days.
   - Has payment frequency.
   - Attributes:
     - `id` (Primary Key)
     - `name`
     - `members` (List of user IDs)
     - `tontines` (List of tontine IDs)
     - `meeting_days` (List of days)
     - `payment_frequency`
     - `balance`
     - `loan_conditions`
     - `transactions` (List of transaction IDs for reporting)

3. **Tontine**
   - Belongs to an association.
   - Has members (users).
   - Attributes:
     - `id` (Primary Key)
     - `name`
     - `association_id` (Foreign Key)
     - `members` (List of user IDs)
     - `balance`
     - `contribution_frequency`
     - `contribution_amount`
     - `cycle_duration` (Duration of a complete cycle)
     - `current_cycle` (Cycle tracking to know whose turn it is to receive the amount)
     - `transactions` (List of transaction IDs for reporting)

4. **Loan**
   - Provided by an association to its members.
   - Attributes:
     - `id` (Primary Key)
     - `association_id` (Foreign Key)
     - `member_id` (Foreign Key)
     - `amount`
     - `repayment_period`
     - `monthly_repayment_amount`
     - `interest_rate`
     - `status`

5. **Transaction**
   - Records every financial transaction within an association and tontine.
   - Attributes:
     - `id` (Primary Key)
     - `association_id` (Foreign Key)
     - `tontine_id` (Foreign Key, optional)
     - `user_id` (Foreign Key)
     - `type` (e.g., contribution, loan disbursement, loan repayment)
     - `amount`
     - `date`
     - `payment_method_id` (Foreign Key)

6. **PaymentMethod**
   - Various payment methods used for transactions.
   - Attributes:
     - `id` (Primary Key)
     - `user_id` (Foreign Key)
     - `type` (e.g., Mobile Money, Bank Transfer)
     - `details` (JSON object containing specific details about the payment method, e.g., mobile money number)

#### Entity-Relationship Diagram (ERD)

Below is a simplified text-based ERD representation of the system:

```
User
-----
id (PK)
phone_number
name
associations (List of association IDs)
roles (List of roles in associations)

Association
-----------
id (PK)
name
members (List of user IDs)
tontines (List of tontine IDs)
meeting_days (List of days)
payment_frequency
balance
loan_conditions
transactions (List of transaction IDs)

Tontine
-------
id (PK)
name
association_id (FK)
members (List of user IDs)
balance
contribution_frequency
contribution_amount
cycle_duration
current_cycle
transactions (List of transaction IDs)

Loan
----
id (PK)
association_id (FK)
member_id (FK)
amount
repayment_period
monthly_repayment_amount
interest_rate
status

Transaction
-----------
id (PK)
association_id (FK)
tontine_id (FK, optional)
user_id (FK)
type
amount
date
payment_method_id (FK)

PaymentMethod
-------------
id (PK)
user_id (FK)
type
details
```

#### Detailed Entity Attributes and Relationships

1. **User**
   - `id`: Unique identifier for the user.
   - `phone_number`: User's phone number.
   - `name`: User's name.
   - `associations`: List of associations the user is part of.
   - `roles`: List of roles (admin or member) the user has in each association.

2. **Association**
   - `id`: Unique identifier for the association.
   - `name`: Name of the association.
   - `members`: List of user IDs who are members of the association.
   - `tontines`: List of tontine IDs within the association.
   - `meeting_days`: List of days the association meets.
   - `payment_frequency`: Frequency of payments within the association.
   - `balance`: Total balance of the association.
   - `loan_conditions`: Conditions for loans provided by the association.
   - `transactions`: List of transaction IDs for reporting.

3. **Tontine**
   - `id`: Unique identifier for the tontine.
   - `name`: Name of the tontine.
   - `association_id`: Foreign key linking the tontine to its association.
   - `members`: List of user IDs who are members of the tontine.
   - `balance`: Total balance of the tontine.
   - `contribution_frequency`: Frequency of contributions within the tontine.
   - `contribution_amount`: Amount each member contributes per cycle.
   - `cycle_duration`: Duration of a complete cycle.
   - `current_cycle`: Cycle tracking to know whose turn it is to receive the amount.
   - `transactions`: List of transaction IDs for reporting.

4. **Loan**
   - `id`: Unique identifier for the loan.
   - `association_id`: Foreign key linking the loan to its association.
   - `member_id`: Foreign key linking the loan to the member who took it.
   - `amount`: Amount of the loan.
   - `repayment_period`: Period over which the loan is to be repaid.
   - `monthly_repayment_amount`: Amount to be repaid each month.
   - `interest_rate`: Interest rate on the loan.
   - `status`: Status of the loan (e.g., pending, repaid).

5. **Transaction**
   - `id`: Unique identifier for the transaction.
   - `association_id`: Foreign key linking the transaction to its association.
   - `tontine_id`: Foreign key linking the transaction to its tontine (if applicable).
   - `user_id`: Foreign key linking the transaction to the user who made it.
   - `type`: Type of transaction (e.g., contribution, loan disbursement, loan repayment).
   - `amount`: Amount of the transaction.
   - `date`: Date of the transaction.
   - `payment_method_id`: Foreign key linking the transaction to the payment method used.

6. **PaymentMethod**
   - `id`: Unique identifier for the payment method.
   - `user_id`: Foreign key linking the payment method to its user.
   - `type`: Type of payment method (e.g., Mobile Money, Bank Transfer).
   - `details`: JSON object containing specific details about the payment method, such as mobile money number.

### Relationships and Constraints

- **User-Association**:
  - A user can be a member of multiple associations.
  - A user can be an admin in multiple associations.
  - An association can have multiple users.
  - Relationship: Many-to-Many (with roles).

- **Association-Tontine**:
  - An association can have multiple tontines.
  - A tontine belongs to one association.
  - Relationship: One-to-Many.

- **Tontine-User**:
  - A tontine can have multiple users.
  - A user can belong to multiple tontines within an association.
  - Relationship: Many-to-Many.

- **Association-Loan**:
  - An association provides loans to its members.
  - A loan is associated with one association and one member.
  - Relationship: One-to-Many (association to loans), One-to-Many (user to loans).

- **Association-Transaction**:
  - An association can have multiple transactions.
  - Relationship: One-to-Many.

- **Tontine-Transaction**:
  - A tontine can have multiple transactions.
  - Relationship: One-to-Many.

- **Transaction-PaymentMethod**:
  - A transaction is made using one payment method.
  - A payment method can be used for multiple transactions.
  - Relationship: One-to-Many.

- **User-PaymentMethod**:
  - A user can have multiple payment methods.
  - Relationship: One-to-Many.

### Summary

This updated conceptual model includes the integration of payment methods into the system. Every transaction in the system is now associated with a payment method, ensuring that contributions and loan repayments are properly recorded and tracked. This model will guide the backend development, ensuring that all financial operations are transparent and traceable.