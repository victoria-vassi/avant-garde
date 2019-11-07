require 'faker'

puts "Seeding 1 dev user, 10 buyers (user), 10 sellers (user) and 10 sellers (user)..."
puts "------------------"

dev = User.create(
  email: "dev@email.com",
  password: "password",
  first_name:  Faker::Name.first_name,
  last_name: Faker::Name.last_name,
)

10.times do
  user = User.create!(
    email:    Faker::Internet.email,
    password: "password",
    first_name:  Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )

  seller = Seller.create!(
    name:    Faker::Name.name,
    address:  Faker::Address.full_address,
    website: Faker::Internet.url,
  )

  renter = Renter.create!(
    name:    Faker::Name.name,
    address:  Faker::Address.full_address,
    website: Faker::Internet.url,
  )
end

puts 'Creating 10 art campaigns...'

campaign_attributes = [
   {
    artist: "Gerhard Richter",
    title: "Bagdad",
    year: "2014",
    category: "Painting",
    movement: "Contemporary art",
    technique: "Prints and multiples",
    dimension: "50.0 x 40.0 cm",
    description_short: "Gerhard Richter (German, b.1932) is a preeminent postwar painter. Born in Dresden, his youth was marked by the Nazi and Communist regimes in Germany, and his uneasy relationship to German history would persist as a central theme in his work. In the early 1950s, he attended the Kunstakademie in Dresden, where he was trained in Socialist Realist painting, before moving to West Germany and studying avant-garde art at the Kunstakademie in Düsseldorf.",
    description_long: "Richter is known for a stylistically varied exploration of the medium of painting. He could be described as ambidextrous as he has had success as both figurative and and abstract artist. In “Bagdad” is a fine example of Richter' dynamic and color-rich abstractions. Produced by Heni Productions and the Serpentine Galleries under the artist’s close supervision, the Bagdad series is a beautiful, accessible example by one of today’s most iconic artists.",
    value_increase_rate: 5.5,
    payout_rate: 0.3,
    funding_status: 45,
    funded: false,
    price: 40000,
    end_date: n = Date.today + 45,
    start_date: n - 60,
    minimum_investment: 2000,
    seller: Seller.all.sample,
    renter: Renter.all.sample
   },

   {
    artist: "George Condo",
    title: "Face",
    year: "1985",
    category: "Oil on canvas",
    movement: "Contemporary art",
    technique: "Painting",
    dimension: "81.9 x 65.0 cm",
    description_short: "Face(1985) is an important early oil painting by George Condo featuring his signature distorted character against an abstract background of earthy mid-tones. Recalling genres as diverse as European portraiture, Cubism, Expressionism, and Surrealism – sometimes all at once – Condo’s works can be incredibly humorous, and, at the same time, eerily dark. Condo explains, 'The landscape I live in is the landscape of ripped drawings, of paint all over the place, of pencil sketches and drawings that have been compiled, images that have been thought about and turned and twisted.'",
    description_long: "George Condo (American, b. 1957) is one of the most celebrated figurative painters of the last 30 years. He has exhibited throughout the United States and in Europe, at institutions including at the Whitney Museum of American Art, New York; the Museum of Modern Art, New York; the Contemporary Arts Museum, Houston; the Solomon R. Guggenheim Museum, New York; the Albright-Knox Art Gallery, Buffalo; Fonds National d'Art Contemporain, Salzburg; Ministere de la Culture, Paris; Museu d'Art Contemporani, Barcelona; the Museum of Fine Arts, Houston; the Kunsthalle Bielefeld in Germany; and the Wrong Gallery in the Tate Modern, London. A retrospective of his work was held at the New Museum, New York in 2011 and the Phillips Collection, Washington, D.C. will host a drawings retrospective in 2017. Condo is represented by Skarstedt Gallery, New York and Sprüth Magers, Berlin.",
    value_increase_rate: 1.8,
    payout_rate: 0.2,
    funding_status: 88,
    funded: false,
    price: 252000,
    end_date: n = Date.today + 12,
    start_date: n - 60,
    minimum_investment: "1",
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Annie Leibovitz",
    title: "Keith Haring, New York",
    year: "1986",
    category: "Photograph",
    movement: "Contemporary art",
    technique: "Cibachrome",
    dimension: "31.8 x 40.0 cm",
    description_short: "'Keith Haring was as much an artist as he was an activist by taking his cartoonish figures to shed light on themes of sexuality, apartheid, death, and many others. Diagnosed with AIDS in 1988, Haring was open with his diagnosis, which was incredibly taboo. He was an instrumental figure in spreading the awareness of AIDS and bringing it into public discourse with his Pop images. It is a legacy that lives on today.' —Susanna Wenniger, Senior Specialist, Photographs",
    description_long: "Adept at capturing her subject’s personality and inner life, Annie Leibovitz’s images reflect intimate or staged moments that reveal the playful and expressive aspects of her sitters. To photograph the artist Keith Haring, Annie Leibovitz constructed the studio as someone’s living room, and painted it entirely white, which Haring later transformed with his own signature style. As Haring arrived at the studio, he painted the room with black lines, and covered his entire torso with body paint. Showing full frontal in posture and gaze, Haring’s recognizable artistic style, as well as his bold personality, are memorialized in Leibovitz’s photograph, taken just a few years before Haring’s death. Annie Leibovitz (American, b. 1949) is a prolific photojournalist, who has produced some of the past decades most iconic images of celebrities, among the likes of Michael Jackson and Queen Elizabeth II. Known for her intimate portraits of celebrated figures, she is able to deftly supply glimpses into the private sides of these personalities. Starting her career at Rolling Stone, Leibovitz gained access to notable musicians, particularly John Lennon and Yoko Ono, who Leibovitz captured a mere two hours before his death. In 1991, she became one of the only women to hold a solo exhibition t the National Portrait Gallery in Washington, D.C. in 2008. Leibovitz’s photographs are in the permanent collections of the Art Institute of Chicago, The Museum of Modern Art in New York, and the Los Angeles County Museum of Art, among others. In 2009, Leibovitz was awarded the prestigious Royal Photographic Society’s Centenary Medal and Honorary Fellowship. Currently, she lives and works in New York, NY where she regularly contributes to Vanity Fair and Vogue.",
    value_increase_rate: 3.5,
    payout_rate: 0.4,
    funding_status: 100,
    funded: true,
    price: 30000,
    end_date: n = Date.today - 1,
    start_date: n - 60,
    minimum_investment: 500,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Jeff Koons",
    title: "Balloon Venus - Dom Perignon",
    year: "2013",
    category: "Sculture",
    movement: "Pop Art",
    technique: "Mirror-polished stainless steel",
    dimension: "61.5 x 35.5 x 32.5 cm",
    description_short: "Jeff Koons created the Balloon Venus for Dom Pérignon in 2013. Inspired by a tiny Palaeolithic figurine discovered in Austria, the Balloon Venus is an adaptation of Jeff Koons’ monumental sculpture and proposes a new kind of idol: a modern day goddess of love who embraces in her reflective curves.",
    description_long: "Jeff Koons plays with ideas of taste, pleasure, celebrity, and commerce. “I believe in advertisement and media completely,” he says. “My art and my personal life are based in it.” Working with seductive commercial materials (such as the high chromium stainless steel of his “Balloon Dog” sculptures or his vinyl “Inflatables”), shifts of scale, and an elaborate studio system involving many technicians, Koons turns banal objects into high art icons. His paintings and sculptures borrow widely from art-historical techniques and styles; although often seen as ironic or tongue-in-cheek, Koons insists his practice is earnest and optimistic. “I’ve always loved Surrealism and Dada and Pop, so I just follow my interests and focus on them,” he says. “When you do that, things become very metaphysical.” The “Banality” series that brought him fame in the 1980s included pseudo-Baroque sculptures of subjects like Michael Jackson with his pet ape, while his monumental topiaries, like the floral Puppy (1992), reference 17th-century French garden design.",
    value_increase_rate: 3.5,
    payout_rate: 0.7,
    funding_status: 13,
    funded: false,
    price: 100624,
    end_date: n = Date.today + 90,
    start_date: n - 60,
    minimum_investment: 3000,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Yayoi Kusama",
    title: "Fireflies",
    year: "1999",
    category: "Print",
    movement: "Contemporary art",
    technique: "Color screenprint on paper",
    dimension: "59.7 x 47.8 cm",
    description_short: "'Fireflies' (1999) is one of Japanese female artist Yayoi Kusama's most sought after and desirable silkscreen prints, and this is only the fourth time any edition of this print has ever come to international auction. Yayoi Kusama is best known for her works featuring repeating motifs and psychedelic imagery that evoke themes of psychology, feminism, obsession, sex, creation, destruction, and intense self-reflection. Here dark green and black infinity nets swim through space, with bright red polka dots representing fireflies glow against the lush background. Although her œuvre is incredibly varied, Kusama's best works possess, as Kusama herself states, patterns 'without beginning, end, or center... This endless repetition caused a kind of dizzy, empty, hypnotic feeling.' This print is edition 59/100, measures 23.5 x 18.8 in. (59.7 x 47.7 cm), is custom framed with UV glass to larger dimensions, and is in pristine condition.",
    description_long: "Kusama was born in Matsumoto City, Japan and began painting at the age of ten, as a means of escaping a childhood of neglect and expressing her early experiences with hallucinogenic visions. These apparitions consisted of dots and patterns enveloping her surroundings, suggesting issues of mental illness which have continued to strongly influence her work. For her oeuvre, Kusama has received numerous awards and honors, including the 1996 International Art Critic Association Prize, the 2000 Education Minister’s Art Encouragement Prize & Foreign Minister’s Commendations, and the 2003 Ordre des Arts et des Lettres. ",
    value_increase_rate: 2.4,
    payout_rate: 0.5,
    funding_status: 25,
    funded: false,
    price: 11000,
    end_date: n = Date.today + 7,
    start_date: n - 60,
    minimum_investment: 200,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "David Hockney",
    title: "Pool Made with Paper and Blue Ink for Book (from Paper Pools)",
    year: "1980",
    category: "Drawing",
    movement: "Contemporary art",
    technique: "Lithograph in colors",
    dimension: "26.7 x 22.9 cm",
    description_short: "Published in 1980, this color lithograph explores the interplay of color, light and spatial dimensions in a pool, one of David Hockney's signature motifs. Moving to Los Angeles inspired the English-born artist to work in the bright California palette for which he is now well-known. The aquamarine California swimming pools set against the L.A. skyline provided Hockney with the perfect subject matter to explore the glossy surface of American popular culture. This print comes with a copy of Hockney's Paper Pools book in its original case.",
    description_long: "David Hockney is one of the most influential British artists of the 20th century. He is perhaps best known for his serial paintings of swimming pools, portraits of friends, and verdant landscapes. The artist’s oeuvre ranges from collaged photography and opera posters, to Cubist-inspired abstractions and plein-air paintings of the English countryside. Often returning to a certain motif again and again, he probes the manifold ways one can see an image or a space. Hockney’s exploration of photography’s effect on painting and everyday life is evinced in his hallmark work A Bigger Splash (1967). “In art, new ways of seeing mean new ways of feeling; you can't divorce the two, as, we are now aware, you cannot have time without space and space without time,” he has explained. Born on July 9, 1937 in Bradford, United Kingdom, Hockney attended the Royal College of Art in London alongside R.B. Kitaj. At school, he studied under both Francis Bacon and Peter Blake, but also credits Pablo Picasso and Henri Matisse for influencing his distinctive and varied style.",
    value_increase_rate: 4.2,
    payout_rate: 0.4,
    funding_status: 100,
    funded: true,
    price: 350000,
    end_date: n = Date.today - 1,
    start_date: n - 60,
    minimum_investment: 5000,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Louise Fishman",
    title: "Ida's Special",
    year: "1986",
    category: "Painting",
    movement: "Abstract art",
    technique: "Oil on canvas",
    dimension: "155.0 x 91.6 cm",
    description_short: "Louise Fishman is a contemporary American artist known for her expressive abstract paintings. Rooted in her experiences as a feminist and advocate for LGBT rights, Fishman’s works are channels for the cathartic expression of memories and anger as well as the process of painting itself.",
    description_long: "Abstract painter Louise Fishman is drawn to personal experience, stories, and political activism. Through the 1960s, she produced primarily Minimalist-inspired, grid-like paintings. In the early 1970s, in pursuit of a more definitively feminine practice, she gave up abstract painting, which was considered the hotbed of art world machismo, to explore sculptural processes like sewing and knitting, which were traditionally defined as “women’s work.” Returning to painting in 1973, she produced a series called “Angry Women,” which announced the expressive brushwork and muddy pigment that are hallmarks of her mature style. In 1988, a trip to Eastern Europe, where she visited two concentration camps, reinforced the dark, mysteriously emotive quality of Fishman’s vigorously worked paintings, including her 1989 series of eight paintings, “Remembrance and Renewal,” in which she mixed ashes and beeswax into her paints.",
    value_increase_rate: 3.8,
    payout_rate: 0.5,
    funding_status: 30,
    funded: false,
    price: 20000,
    end_date: n = Date.today + 14,
    start_date: n - 60,
    minimum_investment: 500,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Manolo Valdés",
    title: "Las señoritas de Avignon (Les Demoiselles d'Avignon)",
    year: "1989",
    category: "Painting",
    movement: "Abstract art",
    technique: "Collage on burlap",
    dimension: "229.5 x 204.0 x 7.0 cm",
    description_short: "Manolo Valdés is a Spanish artist residing in New York, working in paint, sculpture, and mixed media. He introduced to Spain a form of expression that combined political and social obligations with humor and irony.",
    description_long: "Declaring himself “a consumer of art and its history,” Manolo Valdés ranges deftly across mediums, producing witty, art-historically informed drawings, paintings, prints, and sculptures that explore history and contemporary culture, politics and everyday life. Approaching each medium as part of an interconnected whole, Valdés asserts: “That is what art is all about—how to invent many projects from one single image.” Trained as a painter, Valdés grew up imbibing the works of Spanish masters like Diego Velázquez and Pablo Picasso, later becoming influenced by Pop Art. With Rafael Solbes and Joan Toledo, he formed Equipo Crónica group (early 1960s-1981), utilizing the Pop idiom to criticize Spanish dictator Francisco Franco in scathing paintings. References to Spain abound in his work, in portraits resembling its royalty, sculptures recalling Don Quixote and Sancho Panza, or in the recurring, semi-abstracted figure of the Infanta from Velazquez’s Las Meninas (1656).",
    value_increase_rate: 4.9,
    payout_rate: 0.0,
    funding_status: 100,
    funded: true,
    price: 350000,
    end_date: n = Date.today - 30,
    start_date: n - 60,
    minimum_investment: 10000,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Brice Marden",
    title: "Rock 4",
    year: "2000",
    category: "Painting",
    movement: "Contemporary Art",
    technique: "Ink on Lanaquarelle paper",
    dimension: "29.2 x 15.9 cm",
    description_short: "Brice Marden is a contemporary American painter known for his subtle explorations of color and gestural lines. Like Robert Ryman, Robert Mangold, and Agnes Martin, Marden’s canvases are the product of an ongoing investigation into the nature of abstraction and the medium of painting itself. “A painting, you know, it's all dirty material. But it's about transformation,” the artist mused.",
    description_long: "Often rejecting the styles of his contemporaries, Marden was born in Bronxville and lives in New York City and Tivoli, New York. He takes inspiration from Asian art and demonstrates a gestural and organic emotion. He prefers to leave the meaning in his work ambigious and open to interpretation, thus encouraging viewers to associate their own emotions with his art. Expanding internationally after his first solo show at Bykert Gallery, this minimalist has been shown in hundreds of exhibitions and became a member of the American Academy of Arts and Letters in 1998.",
    value_increase_rate: 2.5,
    payout_rate: 0.2,
    funding_status: 67,
    funded: false,
    price: 150000,
    end_date: n = Date.today + 30,
    start_date: n - 60,
    minimum_investment: 1000,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Banksy",
    title: "Christ with Shopping Bags",
    year: "2004",
    category: "Print",
    movement: "Contemporary Art",
    technique: "Screenprint in colors",
    dimension: "69.0 x 49.0 cm",
    description_short: "Banksy is undoubtably the world’s most sought-after and talked about street artist, his work represents his political and social commentary on the world, and has appeared on city walls throughout it – from London to New York, from Jamaica to the Gaza Strip.",
    description_long: " Banksy’s controversial screenprint Christ with Shopping Bags, sometimes known as Consumer Jesus or CWSB, was released in 2004 as a limited edition of 82 prints signed by the artist. Unusually for Banksy, he never put the image on the street, and its relatively low edition size places it in high demand. The artwork shows the crucifixion of Jesus Christ as if hanging from the cross, yet Banksy has removed the structure of the cross from the iconic scene. Instead of nails through his hands, shopping bags have been drawn in, each festooned in fluorescent pink ribbon, but appearing to be seeping with black blood. Christmas presents seem to bulge from the shopping bags, including commercially associated childhood icons: the candy cane and Mickey Mouse.",
    value_increase_rate: 7.8,
    payout_rate: 0.2,
    funding_status: 100,
    funded: true,
    price: 23000,
    end_date: n = Date.today - 3,
    start_date: n - 60,
    minimum_investment: 230,
    seller: Seller.all.sample,
    renter: Renter.all.sample,
  }
]

campaign_attributes.each do |campaign|
  Campaign.create!(campaign)
end

puts "Finish creating 10 campaigns"


photo_attributes = [
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926497/Avant%20Garde/bagdad1_qbxmdj.jpg",
    campaign_id: 1
  },
    {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926496/Avant%20Garde/bagdad2_ffgcak.jpg",
    campaign_id: 1
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926495/Avant%20Garde/face1_kbux82.jpg",
    campaign_id: 2
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926497/Avant%20Garde/Haring1_hatk37.jpg",
    campaign_id: 3
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926497/Avant%20Garde/Koons1_evduwn.jpg",
    campaign_id: 4
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926498/Avant%20Garde/koons2_eg5exn.jpg",
    campaign_id: 4
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926497/Avant%20Garde/koons3_sfvpvu.jpg",
    campaign_id: 4
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926496/Avant%20Garde/Kusama1_enfidc.jpg",
    campaign_id: 5
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926495/Avant%20Garde/david1_cqxxtg.jpg",
    campaign_id: 6
  },
    {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926498/Avant%20Garde/Fishman1_oa2blc.jpg",
    campaign_id: 7
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926498/Avant%20Garde/Valde%CC%81s1_d1dtlx.jpg",
    campaign_id: 8
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926497/Avant%20Garde/Marden1_t3pcg2.jpg",
    campaign_id: 9
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926495/Avant%20Garde/bansky1_x5j4ty.jpg",
    campaign_id: 10
  }
]

  photo_attributes.each do |photo|
    Image.create!(photo)
  end

investments = [
  {
    amount: 500,
    user: dev,
    campaign: Campaign.find(1)
  },
  {
    amount: 230,
    user: dev,
    campaign: Campaign.find(2)
  },
  {
    amount: 1000,
    user: dev,
    campaign: Campaign.find(3)
  },
  {
    amount: 2000,
    user: dev,
    campaign: Campaign.find(4)
  },
  {
    amount: 1000,
    user: dev,
    campaign: Campaign.find(5)
  },
  {
    amount: 1300,
    user: dev,
    campaign: Campaign.find(6)
  }
]

investments.each do |investment|
  Investment.create!(investment)
end



