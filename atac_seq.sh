#ATAC seq using CellRanger-ATAC


#connect to aws
cd aws.ssh #switch to an aws folder 

ssh -i "MyKeyPair.pem"  ubuntu@ec2-3-20-239-243.us-east-2.compute.amazonaws.com
#transfer files through filezilla using MyKeyPair.pem


#download and install cellranger

wget -O cellranger-atac-1.1.0.tar.gz "http://cf.10xgenomics.com/releases/cell-atac/cellranger-atac-1.1.0.tar.gz?Expires=1570683513&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWF0YWMvY2VsbHJhbmdlci1hdGFjLTEuMS4wLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTU3MDY4MzUxM319fV19&Signature=ATQwkVCRBnV66nw0rADeYxnpSokruQdMBFM~fLRsZDHgd2jB2wSm0Mxr1gLN3LoTCrUMxP~fq2wTDwnmURi~QM9hfCiGYKXK9dszAYhkUpIuQY9IGbKMuX0EwwKB437w5bLuOTxKzYiMJ0LgzjAHpDHi0jiRfT2FTwVC9N9GrlYK7LtRMNaxNRDw15roaj~h96oN-ENX3lkB2O3dGBGv26dxeRoJ~F~podEkITxg2ySe-yrJ7NXoQHO3uiykMa1TXYeyseJyuHgls41ROJkcLdeYnXm9ErzSxuPgbt8B2-rzKYRmPXgsZ1H8Z7Q0piGxUlr24H506GopE7twsmvlOA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

curl -o cellranger-atac-1.1.0.tar.gz "http://cf.10xgenomics.com/releases/cell-atac/cellranger-atac-1.1.0.tar.gz?Expires=1570766133&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWF0YWMvY2VsbHJhbmdlci1hdGFjLTEuMS4wLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTU3MDc2NjEzM319fV19&Signature=gc3gU9KucfVnssa2LCWplw2WvjV23aFeVSpocwavBRIEV27jKdwBX8ZilNCJndneEwYL~w0QaO3S4iXEBuKKoPHLIZ0Y1jCD9U2jG45ohNUOX248d6iOwggf6eKVgWUpx9w9afFp6CCiHoS3GECQmUT8vBkqS4GJ6E3~TSj6Zqzof1BU-1UvGCihfoxV9DHjTVopxOt3LyU9-6QVo3QKAJhjZHg78yw32j0YkrbZxNMaXjf453e-kyuhoWw~pFlrAibsIy73GtmaDrN~p3I1uzhadyngSc87JlHtNYVToKPHaz0RI57HZ1MfzKgN6-FRA0ViU1v2NSGbtKNVQoVPxw__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-GRCh38-1.1.0.tar.gz

#unpack tars
tar -xzvf cellranger-atac-1.1.0.tar.gz
tar -xzvf refdata-cellranger-atac-GRCh38-1.1.0.tar.gz

#set to Path
PATH=~/cellranger-atac-1.1.0:$PATH
export PATH=~/cellranger-atac-1.1.0:$PATH


#counts
cellranger-atac count --id=HDF_1 --reference=~/refdata-cellranger-atac-GRCh38-1.1.0 --fastqs=/home/ubuntu --sample=HDF_1
cellranger-atac count --id=MGT_1 --reference=~/refdata-cellranger-atac-GRCh38-1.1.0 --fastqs=/home/ubuntu --sample=MGT_1 
cellranger-atac count --id=MGT_siAJSZ_1 --reference=~/refdata-cellranger-atac-GRCh38-1.1.0 --fastqs=/home/ubuntu --sample=MGT_siAJSZ_1
cellranger-atac count --id=HDF_2--reference=~/refdata-cellranger-atac-GRCh38-1.1.0 --fastqs=/home/ubuntu --sample=HDF_2
cellranger-atac count --id=MGT_2 --reference=~/refdata-cellranger-atac-GRCh38-1.1.0 --fastqs=/home/ubuntu --sample=MGT_2
cellranger-atac count --id=MGT_siAJSZ_2 --reference=~/refdata-cellranger-atac-GRCh38-1.1.0 --fastqs=/home/ubuntu --sample=MGT_siAJSZ_2




