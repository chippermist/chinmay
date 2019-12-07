# Final Project Proposal

### Idea

After looking into the possible project using GANs, I wasn't particular impressed by the results and thought the time would not be enough to be able to train and modify a GAN model to obtain a good result. So instead I will continue and expand on my last library project. I will add elements that could be used to create landscape drawings in processing. Some of these will include adding the ability to add a background sky with different variations, adding water given a specific limit on the frame height and being able to add other objects such as basic trees, and weather elements. 

Along with this I would like to create about 4-5 examples of landscape drawings using this library along with some other processing includes as examples. Building up on my initial idea of using GAN to generate abstract images, I will instead use these processing generated artwork to create a more artistic stylized image. I played around with RunwayML since they have pre-trained models with larger datasets and got significantly better results than the locally trained model. I will use this to stylize my library examples into a more relistic look. 

Some example functions within the library will look like:
`mountain(...)` - draw mountains
`tree(...)` - draw trees
`snowflake(...)` - draw snowflakes
`sun()` - draw sun
`sky(LAYERED/SOLID)` - draw different types of sky
`water()` - draw water body
`noise()`- add noise within different shapes...amongst others...

### Process

- Add more abstract shapes such as trees, weather elements etc. into the Abstract Shapes (maybe Landscape Maker) library
- Create landscape drawings using this library within Processing
- Use RunwayML to convert these computer generated images into more realistic hand drawn landscapes. 

### Who is this useful for?

This library will be useful for people who want to be able to quickly draw certain shapes etc. that require a lot of effort using primitives, and who want to be able to control the designs using built-in processing functions. Using these artists can quickly draw something. 
