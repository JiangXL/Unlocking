import pygame,sys
from pygame.locals import*

pygame.init()

# set up the window
DISPLAYSURF = pygame.display.set_mode((900,600))
pygame.display.set_caption('Hello World')

DISPLAYSURF2 = pygame.display.set_mode((700,600))
pygame.display.set_caption('Hello second World')

#set up the colors
BLACK=(0,0,0)
WHITE=(255,255,255)
RED=(255,0,0)
GREEN=(0,255,0)
BLUE=(0,0,255)

# draw on the surface object
DISPLAYSURF.fill(BLACK)
pygame.draw.rect(DISPLAYSURF,RED,(200,150,100,50))
pygame.draw.rect(DISPLAYSURF,GREEN,(400,350,100,50))
pygame.draw.circle(DISPLAYSURF, GREEN, (500,200), 10)


 # main game loop
while True:

    for event in pygame.event.get():
        if event.type==QUIT:
            pygame.quit()
            sys.exit()
        pygame.display.update()
