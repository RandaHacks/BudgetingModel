sig Transaction {
	train: lone Train
}

sig Train {
	transactions: some Transaction,
	collection: lone Collection
}

sig Collection {
 trains: some Train
}

// for all transactions o in a train d, the parent train of o is d
fact { all d: Train, o: d.transactions | o.train = d }

// for all trains o in a collection d, the parent collection of o is d
fact { all d: Collection, o: d.trains | o.collection = d }

pred example { }
run example for exactly 1 Collection, 1 Train, 2 Transaction
