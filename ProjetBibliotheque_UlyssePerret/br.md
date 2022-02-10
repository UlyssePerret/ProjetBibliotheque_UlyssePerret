//Variables for books
struct Books{
    let title: String
    let author: String
    let gender: String
    let language : String
    let publication_date: String
}#  <#Title#>

                        .toolbar {
                            Button {
                                let book = Book(title: "Test", author:"Auteur",gender:"Genre", language:"Langue", publication_date:"Date de publication")
                                library.books.append(contentOf:library)
                            } label: {
                                
                            }
