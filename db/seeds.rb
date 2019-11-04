Art.destroy_all

user = User.new(
    email:    Faker::Internet.email,
    password: "password",
    first_name:  Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )

puts 'Creating 10 art campaigns...'

campaign_1 = Campaign.new(
    artist: "Gerhard Richter"
    title: "Bagdad (P9), numbered '324/500'"
    year: "2014"
    category: "Painting"
    mouvement: "Contemporary art"
    technique: "Prints and multiples, diasec-mounted chromogenic prints on aluminum; face mounted to Plexiglas"
    dimension: "19 5/8 x 15 ¾in. (50 x 40cm.)"
    short_description: "Gerhard Richter (German, b.1932) is a preeminent postwar painter. Born in Dresden, his youth was marked by the Nazi and Communist regimes in Germany, and his uneasy relationship to German history would persist as a central theme in his work. In the early 1950s, he attended the Kunstakademie in Dresden, where he was trained in Socialist Realist painting, before moving to West Germany and studying avant-garde art at the Kunstakademie in Düsseldorf."
    long_description: "Richter is known for a stylistically varied exploration of the medium of painting. He could be described as ambidextrous as he has had success as both figurative and and abstract artist. In “Bagdad” is a fine example of Richter' dynamic and color-rich abstractions. Produced by Heni Productions and the Serpentine Galleries under the artist’s close supervision, the Bagdad series is a beautiful, accessible example by one of today’s most iconic artists."
    value_increase_rate: 5.5
    payout_rate: 0.3
    funding_status: 45
    funded: false
    price: 40000
    end_date: Date.today + 45
    minimum_investment: 2000
  )
  campaign_1.save!

campaign_2 = Campaign.new(
    artist: "George Condo"
    title: "Face'"
    year: "1985"
    category: "Oil on canvas"
    mouvement: "Contemporary art"
    technique: "Painting"
    dimension: "32.25 x 25.6 in. (81.92 x 65.02 cm.)"
    short_description: "Face(1985) is an important early oil painting by George Condo featuring his signature distorted character against an abstract background of earthy mid-tones. Recalling genres as diverse as European portraiture, Cubism, Expressionism, and Surrealism – sometimes all at once – Condo’s works can be incredibly humorous, and, at the same time, eerily dark. Condo explains, 'The landscape I live in is the landscape of ripped drawings, of paint all over the place, of pencil sketches and drawings that have been compiled, images that have been thought about and turned and twisted.'"
    long_description: "George Condo (American, b. 1957) is one of the most celebrated figurative painters of the last 30 years. He has exhibited throughout the United States and in Europe, at institutions including at the Whitney Museum of American Art, New York; the Museum of Modern Art, New York; the Contemporary Arts Museum, Houston; the Solomon R. Guggenheim Museum, New York; the Albright-Knox Art Gallery, Buffalo; Fonds National d'Art Contemporain, Salzburg; Ministere de la Culture, Paris; Museu d'Art Contemporani, Barcelona; the Museum of Fine Arts, Houston; the Kunsthalle Bielefeld in Germany; and the Wrong Gallery in the Tate Modern, London. A retrospective of his work was held at the New Museum, New York in 2011 and the Phillips Collection, Washington, D.C. will host a drawings retrospective in 2017. Condo is represented by Skarstedt Gallery, New York and Sprüth Magers, Berlin."
    value_increase_rate: 1.083
    payout_rate: 0.1
    funding_status: 88
    funded: false
    price: 252000
    end_date: Date.today + 12
    minimum_investment: "1"
  )
  campaign_2.save!

campaign_3 = Campaign.new(
    artist: "Annie Leibovitz"
    title: "Keith Haring, New York"
    year: "1986"
    category: "Photograph"
    mouvement: "Contemporary art"
    technique: "Cibachrome"
    dimension: "12.5 x 15.75 in. (31.75 x 40 cm.)"
    short_description: "'Keith Haring was as much an artist as he was an activist by taking his cartoonish figures to shed light on themes of sexuality, apartheid, death, and many others. Diagnosed with AIDS in 1988, Haring was open with his diagnosis, which was incredibly taboo. He was an instrumental figure in spreading the awareness of AIDS and bringing it into public discourse with his Pop images. It is a legacy that lives on today.' —Susanna Wenniger, Senior Specialist, Photographs"
    long_description: "Adept at capturing her subject’s personality and inner life, Annie Leibovitz’s images reflect intimate or staged moments that reveal the playful and expressive aspects of her sitters. To photograph the artist Keith Haring, Annie Leibovitz constructed the studio as someone’s living room, and painted it entirely white, which Haring later transformed with his own signature style. As Haring arrived at the studio, he painted the room with black lines, and covered his entire torso with body paint. Showing full frontal in posture and gaze, Haring’s recognizable artistic style, as well as his bold personality, are memorialized in Leibovitz’s photograph, taken just a few years before Haring’s death. Annie Leibovitz (American, b. 1949) is a prolific photojournalist, who has produced some of the past decades most iconic images of celebrities, among the likes of Michael Jackson and Queen Elizabeth II. Known for her intimate portraits of celebrated figures, she is able to deftly supply glimpses into the private sides of these personalities. Starting her career at Rolling Stone, Leibovitz gained access to notable musicians, particularly John Lennon and Yoko Ono, who Leibovitz captured a mere two hours before his death. In 1991, she became one of the only women to hold a solo exhibition t the National Portrait Gallery in Washington, D.C. in 2008. Leibovitz’s photographs are in the permanent collections of the Art Institute of Chicago, The Museum of Modern Art in New York, and the Los Angeles County Museum of Art, among others. In 2009, Leibovitz was awarded the prestigious Royal Photographic Society’s Centenary Medal and Honorary Fellowship. Currently, she lives and works in New York, NY where she regularly contributes to Vanity Fair and Vogue."
    value_increase_rate: 3.5
    payout_rate: 0.4
    funding_status: 100
    funded: true
    price: 30000
    end_date: Date.today - 1
    minimum_investment: 500
  )
  campaign_3.save!

  campaign_4 = Campaign.new(
    artist: "Jeff Koons"
    title: "Balloon Venus - Dom Perignon"
    year: "2013"
    category: "Sculture"
    mouvement: "Pop Art"
    technique: "Mirror-polished stainless steel with transparent color coating"
    dimension: "61.5 x 35.5 x 32.5 cm"
    short_description: "Jeff Koons created the Balloon Venus for Dom Pérignon in 2013. Inspired by a tiny Palaeolithic figurine discovered in Austria, the Balloon Venus is an adaptation of Jeff Koons’ monumental sculpture and proposes a new kind of idol: a modern day goddess of love who embraces in her reflective curves."
    long_description: "Jeff Koons plays with ideas of taste, pleasure, celebrity, and commerce. “I believe in advertisement and media completely,” he says. “My art and my personal life are based in it.” Working with seductive commercial materials (such as the high chromium stainless steel of his “Balloon Dog” sculptures or his vinyl “Inflatables”), shifts of scale, and an elaborate studio system involving many technicians, Koons turns banal objects into high art icons. His paintings and sculptures borrow widely from art-historical techniques and styles; although often seen as ironic or tongue-in-cheek, Koons insists his practice is earnest and optimistic. “I’ve always loved Surrealism and Dada and Pop, so I just follow my interests and focus on them,” he says. “When you do that, things become very metaphysical.” The “Banality” series that brought him fame in the 1980s included pseudo-Baroque sculptures of subjects like Michael Jackson with his pet ape, while his monumental topiaries, like the floral Puppy (1992), reference 17th-century French garden design."
    value_increase_rate: 3.5
    payout_rate: 0.7
    funding_status: 3
    funded: false
    price: 100624
    end_date: Date.today + 90
    minimum_investment: 3000
  )
  campaign_4.save!

  campaign_5 = Campaign.new(
    artist: "Yayoi Kusama"
    title: "Fireflies"
    year: "1999"
    category: "Print"
    mouvement: "Contemporary art"
    technique: "Color screenprint on paper"
    dimension: "23.5 x 18.8 in. (59.69 x 47.75 cm.)"
    short_description: "'Fireflies' (1999) is one of Japanese female artist Yayoi Kusama's most sought after and desirable silkscreen prints, and this is only the fourth time any edition of this print has ever come to international auction. Yayoi Kusama is best known for her works featuring repeating motifs and psychedelic imagery that evoke themes of psychology, feminism, obsession, sex, creation, destruction, and intense self-reflection. Here dark green and black infinity nets swim through space, with bright red polka dots representing fireflies glow against the lush background. Although her œuvre is incredibly varied, Kusama's best works possess, as Kusama herself states, patterns 'without beginning, end, or center... This endless repetition caused a kind of dizzy, empty, hypnotic feeling.' This print is edition 59/100, measures 23.5 x 18.8 in. (59.7 x 47.7 cm), is custom framed with UV glass to larger dimensions, and is in pristine condition."
    long_description: "Kusama was born in Matsumoto City, Japan and began painting at the age of ten, as a means of escaping a childhood of neglect and expressing her early experiences with hallucinogenic visions. These apparitions consisted of dots and patterns enveloping her surroundings, suggesting issues of mental illness which have continued to strongly influence her work. For her oeuvre, Kusama has received numerous awards and honors, including the 1996 International Art Critic Association Prize, the 2000 Education Minister’s Art Encouragement Prize & Foreign Minister’s Commendations, and the 2003 Ordre des Arts et des Lettres. "
    value_increase_rate: 2.4
    payout_rate: 0.5
    funding_status: 25
    funded: false
    price: 11000
    end_date: Date.today + 7
    minimum_investment: 200
  )
  campaign_5.save!

  campaign_6 = Campaign.new(
    artist: "David Hockney"
    title: "Pool Made with Paper and Blue Ink for Book (from Paper Pools)"
    year: "1980"
    category: "Drawing"
    mouvement: "Contemporary art"
    technique: "Lithograph in colors on Arches Cover paper and artist's book"
    dimension: "10.5 x 9 in. (26.67 x 22.86 cm.)"
    short_description: "Published in 1980, this color lithograph explores the interplay of color, light and spatial dimensions in a pool, one of David Hockney's signature motifs. Moving to Los Angeles inspired the English-born artist to work in the bright California palette for which he is now well-known. The aquamarine California swimming pools set against the L.A. skyline provided Hockney with the perfect subject matter to explore the glossy surface of American popular culture. This print comes with a copy of Hockney's Paper Pools book in its original case."
    long_description: "David Hockney is one of the most influential British artists of the 20th century. He is perhaps best known for his serial paintings of swimming pools, portraits of friends, and verdant landscapes. The artist’s oeuvre ranges from collaged photography and opera posters, to Cubist-inspired abstractions and plein-air paintings of the English countryside. Often returning to a certain motif again and again, he probes the manifold ways one can see an image or a space. Hockney’s exploration of photography’s effect on painting and everyday life is evinced in his hallmark work A Bigger Splash (1967). “In art, new ways of seeing mean new ways of feeling; you can't divorce the two, as, we are now aware, you cannot have time without space and space without time,” he has explained. Born on July 9, 1937 in Bradford, United Kingdom, Hockney attended the Royal College of Art in London alongside R.B. Kitaj. At school, he studied under both Francis Bacon and Peter Blake, but also credits Pablo Picasso and Henri Matisse for influencing his distinctive and varied style."
    value_increase_rate: 4.2
    payout_rate: 0.4
    funding_status: 94
    funded: false
    price: 350000
    end_date:  Date.today + 4
    minimum_investment: 5000
  )
  campaign_6.save!

  campaign_7 = Campaign.new(
    artist: "Louise Fishman"
    title: "Ida's Special"
    year: "1986"
    category: "Painting"
    mouvement: "Abstract art"
    technique: "Oil on canvas"
    dimension: "61 x 36 1/8 in. (155 x 91.6 cm.)"
    short_description: "Louise Fishman is a contemporary American artist known for her expressive abstract paintings. Rooted in her experiences as a feminist and advocate for LGBT rights, Fishman’s works are channels for the cathartic expression of memories and anger as well as the process of painting itself."
    long_description: "Abstract painter Louise Fishman is drawn to personal experience, stories, and political activism. Through the 1960s, she produced primarily Minimalist-inspired, grid-like paintings. In the early 1970s, in pursuit of a more definitively feminine practice, she gave up abstract painting, which was considered the hotbed of art world machismo, to explore sculptural processes like sewing and knitting, which were traditionally defined as “women’s work.” Returning to painting in 1973, she produced a series called “Angry Women,” which announced the expressive brushwork and muddy pigment that are hallmarks of her mature style. In 1988, a trip to Eastern Europe, where she visited two concentration camps, reinforced the dark, mysteriously emotive quality of Fishman’s vigorously worked paintings, including her 1989 series of eight paintings, “Remembrance and Renewal,” in which she mixed ashes and beeswax into her paints."
    value_increase_rate: 3.8
    payout_rate: 0.5
    funding_status: 0.3
    funded: false
    price: 20000
    end_date: Date.today + 14
    minimum_investment: 500
  )
  campaign_7.save!

  campaign_8 = Campaign.new(
    artist: "Manolo Valdés"
    title: "Las señoritas de Avignon (Les Demoiselles d'Avignon)"
    year: "1989"
    category: "Painting"
    mouvement: "Abstract art"
    technique: "Oil, twine, staples and burlap collage on burlap"
    dimension: "90 3/8 x 80 3/8 x 2 3/4 in. (229.5 x 204 x 7 cm.)"
    short_description: "Manolo Valdés is a Spanish artist residing in New York, working in paint, sculpture, and mixed media. He introduced to Spain a form of expression that combined political and social obligations with humor and irony."
    long_description: "Declaring himself “a consumer of art and its history,” Manolo Valdés ranges deftly across mediums, producing witty, art-historically informed drawings, paintings, prints, and sculptures that explore history and contemporary culture, politics and everyday life. Approaching each medium as part of an interconnected whole, Valdés asserts: “That is what art is all about—how to invent many projects from one single image.” Trained as a painter, Valdés grew up imbibing the works of Spanish masters like Diego Velázquez and Pablo Picasso, later becoming influenced by Pop Art. With Rafael Solbes and Joan Toledo, he formed Equipo Crónica group (early 1960s-1981), utilizing the Pop idiom to criticize Spanish dictator Francisco Franco in scathing paintings. References to Spain abound in his work, in portraits resembling its royalty, sculptures recalling Don Quixote and Sancho Panza, or in the recurring, semi-abstracted figure of the Infanta from Velazquez’s Las Meninas (1656)."
    value_increase_rate: 4.9
    payout_rate: 0.0
    funding_status: 100
    funded: true
    price: 350000
    end_date: Date.today - 30
    minimum_investment: 10000
  )
  campaign_8.save!

    campaign_9 = Campaign.new(
    artist: "Brice Marden"
    title: "Rock 4"
    year: "2000"
    category: "Painting"
    mouvement: "Contemporary Art"
    technique: "Ink on Lanaquarelle paper"
    dimension: "29.2 x 15.9 cm. (11.5 x 6.3 in.)"
    short_description: "Brice Marden is a contemporary American painter known for his subtle explorations of color and gestural lines. Like Robert Ryman, Robert Mangold, and Agnes Martin, Marden’s canvases are the product of an ongoing investigation into the nature of abstraction and the medium of painting itself. “A painting, you know, it's all dirty material. But it's about transformation,” the artist mused."
    long_description: "Often rejecting the styles of his contemporaries, Marden was born in Bronxville and lives in New York City and Tivoli, New York. He takes inspiration from Asian art and demonstrates a gestural and organic emotion. He prefers to leave the meaning in his work ambigious and open to interpretation, thus encouraging viewers to associate their own emotions with his art. Expanding internationally after his first solo show at Bykert Gallery, this minimalist has been shown in hundreds of exhibitions and became a member of the American Academy of Arts and Letters in 1998."
    value_increase_rate: 2.5
    payout_rate: 0.2
    funding_status: 67
    funded: false
    price: 150000
    end_date: Date.today + 30
    minimum_investment: 1000
  )
  campaign_9.save!

  campaign_10 = Campaign.new(
    artist: "Banksy"
    title: "Christ with Shopping Bags"
    year: "2004"
    category: "Print"
    mouvement: "Contemporary Art"
    technique: "Screenprint in colors"
    dimension: "69 x 49 cm. (27.2 x 19.3 in.)"
    short_description: "Banksy is undoubtably the world’s most sought-after and talked about street artist, his work represents his political and social commentary on the world, and has appeared on city walls throughout it – from London to New York, from Jamaica to the Gaza Strip."
    long_description: " Banksy’s controversial screenprint Christ with Shopping Bags, sometimes known as Consumer Jesus or CWSB, was released in 2004 as a limited edition of 82 prints signed by the artist. Unusually for Banksy, he never put the image on the street, and its relatively low edition size places it in high demand. The artwork shows the crucifixion of Jesus Christ as if hanging from the cross, yet Banksy has removed the structure of the cross from the iconic scene. Instead of nails through his hands, shopping bags have been drawn in, each festooned in fluorescent pink ribbon, but appearing to be seeping with black blood. Christmas presents seem to bulge from the shopping bags, including commercially associated childhood icons: the candy cane and Mickey Mouse."
    value_increase_rate: 7.8
    payout_rate: 0.2
    funding_status: 45
    funded: false
    price: 23000
    end_date: Date.today + 1
    minimum_investment: 230
  )
  campaign_10.save!

puts "Finish creating 10 campaigns"

image = Image.create(
    email:    Faker::Internet.email,
    password: "password",
    first_name:  Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )

puts 'Creating 10 art campaigns...'



