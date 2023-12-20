# Zimbra-Rsync
<p>Zimbra Script For Rsync Backup Between Zimbra Server. This is solution for backup between 2 Zimbra mail server with identic Zimbra Version and OS. Use protocol RSYNC with some parameter. Run this script with crontab for scheduler.</p>
<h2>Condition</h2>
<p>I am using zimbra mail server on top of a <strong>virtualization machine</strong>. And <strong>CLONE the VM</strong>, so there is an identical twin server.</p>
<h2>Requirement</h2>
<ol>
<li>Set SSH root Login without Passwd. <a href="https://www.habibza.in/login-remote-ssh-without-password/" target="_blank">See Article</a>.</li>
<li>Install Mailx, for notification. And use zimbra postfix as default mailer mailx when sending email via CLI. <a href="https://www.habibza.in/send-email-with-command-line-terminal-cli-using-zimbra/" target="_blank">See article</a>.</li>
<li>Set Script <a href="https://github.com/habiebzain/Zimbra-Rsync/blob/main/script-backup.sh">above</a> in server-1.</li>
<li>Set scheduler with crontab for set when we need run the script.</li>
</ol>


