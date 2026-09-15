package com.smartbank.util;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;



@Component
public class FileUploadUtil {



    private static final String BASE_PATH =
            System.getProperty("user.dir") + "/uploads";



    /*
     * Constructor
     * Create folders automatically
     */

    public FileUploadUtil(){

        createFolder("aadhaar");

        createFolder("pan");

        createFolder("facevideo");

    }




    private void createFolder(String folderName){

        File folder =
            new File(BASE_PATH + "/" + folderName);


        if(!folder.exists()){

            folder.mkdirs();

        }

    }




    /*
     =====================================
          Upload Aadhaar File
     =====================================
    */

    public String uploadAadhaar(MultipartFile file)
            throws IOException {


        return uploadFile(
                file,
                "aadhaar"
        );

    }




    /*
     =====================================
             Upload PAN File
     =====================================
    */


    public String uploadPan(MultipartFile file)
            throws IOException {


        return uploadFile(
                file,
                "pan"
        );

    }




    /*
     =====================================
             Upload Face Video
     =====================================
    */


    public String uploadFaceVideo(MultipartFile file)
            throws IOException {


        return uploadFile(
                file,
                "facevideo"
        );

    }





    /*
     =====================================
          Common Upload Method
     =====================================
    */


    private String uploadFile(
            MultipartFile file,
            String folder
    )
    throws IOException {



        if(file==null || file.isEmpty()){

            return null;

        }



        String originalName =
                file.getOriginalFilename();



        String extension="";


        if(originalName.contains(".")){


            extension =
            originalName.substring(
                    originalName.lastIndexOf(".")
            );

        }



        String newFileName =
                UUID.randomUUID()
                .toString()
                + extension;




        Path path =
        Path.of(
            BASE_PATH,
            folder,
            newFileName
        );




        Files.copy(
                file.getInputStream(),
                path,
                StandardCopyOption.REPLACE_EXISTING
        );



        return "/uploads/"
                +folder+
                "/"
                +newFileName;

    }



}