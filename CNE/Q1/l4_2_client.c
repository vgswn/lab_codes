#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h> 
#include <fcntl.h> 
#include <unistd.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
int main()
{
	struct sockaddr_in adr;
	int sockfd;
	if((sockfd=socket(AF_INET,SOCK_STREAM,0))==-1)
	{
		perror("socket");
		exit(-1);
	}
	

	adr.sin_family=AF_INET;
	adr.sin_port=htons(1236);
	struct in_addr sin_addr;
	inet_aton("127.0.0.1",&sin_addr);
	adr.sin_addr=sin_addr;
	int len=sizeof(struct sockaddr_in);
	bzero(&adr.sin_zero, 0);	



	if(connect(sockfd,(struct sockaddr *)(&adr),len)<0)
	{
		perror("connect");
		exit(-1);
	}
	int i,j,c;
	char buffer[1024],s[1024];
	c=0;
	while(1)
	{
		c++;
		if(c==1)
		{
			printf("Enter the name of the file\n");
		}
		scanf("%s",s);
		if(strcmp(s,"bye")==0)
		{
			strcpy(buffer,"bye");
			//break;
		}
		else
		{
			FILE *fp;
			fp=fopen(s,"r");
			char ch;
			i=0;
			while((ch=fgetc(fp))!=EOF)
			{
				buffer[i++]=ch;
			}
			buffer[i]='\0';
		}
		char nb[1024];
		int nbs=0;
		for(i=0;i<strlen(buffer);i++)
		{
			nb[nbs++]=buffer[i];
			if(buffer[i]=='*')
			{
				nb[nbs++]='*';
			}
		}
		nb[nbs]='\0';
		strcpy(buffer,nb);
		j=0;
		for(i=1;i<=strlen(buffer)/2;i++)
		{
			char ts[1024]={0};
			for(c=1;c<=2;c++)
			{
				ts[c-1]=buffer[j++];
			}
			ts[2]='\0';
			send(sockfd,ts,1024,0);
		}
		if(strlen(buffer)%2!=0)
		{
			char ts[1024]={0};
			ts[0]=buffer[strlen(buffer)-1];
			ts[1]='\0';
			send(sockfd,ts,1024,0);
		}
		char ts[1024]={0};
		ts[0]='*';
		ts[1]='\0';
		send(sockfd,ts,1024,0);

		//if(strcmp(buffer,"bye")==0)
		{
		//	break;
		}
		if(strcmp(s,"bye")==0)
		{
			//strcpy(buffer,"bye");
			break;
		}
	}
	close(sockfd);

	return 0;
}