### Jump Start Installation Guide (Codespaces)

### Our GCP Project Setup ###
https://miro.com/app/board/uXjVK4A_RLQ=/

### What is a Codespace?
A codespace is a development environment that's hosted in the cloud. You can customize your project for GitHub Codespaces by committing configuration files to your repository (often known as Configuration-as-Code), which creates a repeatable codespace configuration for all users of your project. Github provides a generous free tier of 120 core-hours of Codespaces compute per developer per month. Goal is to get hands on keyboard first and then setup local dev environments once you get a feel of development.

1. Go to cs-analytics repo and click on the <> Code button

2. Click on the three dots next to Codespaces to launch codespaces setup --> Click on New with Options

3. Codespace setup --> Click on Create Codespaces
    * Branch - Main for first timers (eventually branches when you're more comfortable)
    * Dev Container Configuration - dbt-dev-container
    * Region - US East
    * Machine Type - 2 Core

4. After codespace creation, we need to create a profiles.yml for dbt to use. From the Terminal section, open a new bash terminal by clicking on the + sign
   * the dbt_project.yml is red because we haven't created the profiles yet


5. **Create the `.dbt` Folder**
   Navigate to your home directory and create a folder called `.dbt`:
   ```bash
   mkdir $HOME/.dbt
   ```
   * When copying, allow keybindings

6. **Create the `profiles.yml` File**
   In the `.dbt` folder, create an empty file named `profiles.yml`:
   ```bash
   touch $HOME/.dbt/profiles.yml
   ```

7. **Add Boilerplate Code to `profiles.yml`**

   Run this command in the terminal:
   ```bash
   nano $HOME/.dbt/profiles.yml
   ```

   Paste the following boilerplate into `profiles.yml`:
   ```yaml
   bq_creds:
    outputs:
        # Setting up credentials using oauth
        bqdev:
         dataset: dbt_<pls_update> # replace <pls_update> with your first_initial+lastname, e.g., dbt_ezulkifly, dbt_bfethe, etc.
         job_execution_timeout_seconds: 300
         job_retries: 1
         location: US
         method: oauth
         priority: interactive
         project: kxs-rd-sbx-cs-analytics-01
         threads: 10
         type: bigquery

    target: bqdev
   ```
   * Please confirm the dataset key is updated with your details (it must not be the default)
   * To save in Nano: Ctrl + s
   * To exit in Nano: Ctrl + x

8. After profiles.yml is complete:
    * Login to gcloud cli login
    ```bash
        gcloud auth application-default login
    ```
    * Use your GCP kxsrd account for login
    * Paste code snippet into terminal for authentication
    * Ignore the quota project message

9.  Run dbt debug to test configuration

    ```bash
        dbt debug
    ```
  
    * confirm everything passes
