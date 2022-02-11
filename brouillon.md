#  <#Title#>
Test Niavigation (For HomeView)
   /* NavigationView{
                        List{
                            ForEach(library.books, id: \.title){ book in
                                Text(book.title ?? "No Title");
                            }
                            .onDelete(perform: removeBooks)
                        }
                        .navigationTitle("iLibrary")
                        .toolbar {
                            Button {
                                let books = Book  ( )
                               // title = "Test Titre" , author="Test auteur", genre="Test Genre", 
                                library.books.append( books)
                            } label: {
                                Image(systemName: "Plus")
                            }
                        }
                    }**/
