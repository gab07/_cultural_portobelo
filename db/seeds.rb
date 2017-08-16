# encoding: utf-8


Book.destroy_all

Book.create(

	title: 'Codigo1',
	author: 'Pepito',
	publisher: 'Editorial Porotbelo',
	publication_year: '2016',
	price: '50.00',
	country_of_origin: 'España',
	cover: 'http://6.darkroom.shortlist.com/980/9653fce8ef7f3422c2241cccf256f8c4:38694122241a9a66865d64b2467d8e6b/hero-book-covers.jpg'
	)
Book.create(
	title: 'Codigo2',
	author: 'Juanito',
	publisher: 'Editorial Porrua',
	publication_year: '2014',
	price: '40.00',
	country_of_origin: 'Colombia',
	cover: 'http://boxshot.com/boxshot/tutorials/howto/3d-book/3d-ebook-1.png'
	)
Book.create(
	title: 'Codigo3',
	author: 'Pedrito',
	publisher: 'Editorial Morello',
	publication_year: '2015',
	price: '30.00',
	country_of_origin: 'Panama',
	cover: 'http://media02.hongkiat.com/designing-book-covers/37-book-cover-tuts.jpg'
	)
Book.create(
	title: 'Codigo4',
	author: 'Chefito',
	publisher: 'Editorial Woolford',
	publication_year: '2011',
	price: '25.00',
	country_of_origin: 'Mexico',
	cover: 'http://www.clickformedia.co.uk/wp-content/uploads/2009/10/final_cover.jpg'
	)
20.times do |n|
	Category.create(
		name: 'Category_' + n.to_s
	)
end
