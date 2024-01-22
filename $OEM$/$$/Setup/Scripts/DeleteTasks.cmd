@echo off

schtasks /Delete /tn "\Microsoft\Office\Office 15 Subscription Heartbeat" /f                                  &rem - 9 B -
schtasks /Delete /tn "\Microsoft\Office\Office Automatic Updates 2.0" /f                                      &rem - - - C
schtasks /Delete /tn "\Microsoft\Office\Office ClickToRun Service Monitor" /f                                 &rem - - - C
schtasks /Delete /tn "\Microsoft\Office\OfficeBackgroundTaskHandlerLogon" /f                                  &rem - - - C
schtasks /Delete /tn "\Microsoft\Office\OfficeBackgroundTaskHandlerRegistration" /f                           &rem - - - C
schtasks /Delete /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /f                                  &rem - - - C
schtasks /Delete /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /f                                     &rem - - - C

schtasks /Delete /tn "\Microsoft\Windows\AppID\EDP Policy Manager" /f                                         &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /f                                        &rem - 9 B -
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\AitAgent" /f                                  &rem 7 9 - -
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f         &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /f                        &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f                            &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\ApplicationData\appuriverifierdaily" /f                              &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\ApplicationData\appuriverifierinstall" /f                            &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup" /f                      &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Autochk\Proxy" /f                                                    &rem 7 9 B C

schtasks /Delete /tn "\Microsoft\Windows\BitLocker\BitLocker Encrypt All Drives" /f                           &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\BitLocker\BitLocker MDM policy Refresh" /f                           &rem - - - C

schtasks /Delete /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /f                             &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f                   &rem - 9 - -
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f             &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /f           &rem 7 9 B -
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f                  &rem 7 9 B C

schtasks /Delete /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /f                                           &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Device Information\Device" /f                                        &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\HandleCommand" /f                              &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\HandleWnsCommand" /f                           &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" /f                             &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\LocateCommandUserSession" /f                   &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceAccountChange" /f                &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceConnectedToNetwork" /f           &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceLocationRightsChange" /f         &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic1" /f                    &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic24" /f                   &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic6" /f                    &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePolicyChange" /f                 &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceProtectionStateChanged" /f       &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceScreenOnOff" /f                  &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceSettingChange" /f                &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\DeviceDirectoryClient\RegisterUserDevice" /f                         &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Diagnosis\Scheduled" /f                                              &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\DirectX\DXGIAdapterCache" /f                                         &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /f     &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\DUSM\dusmtask" /f                                                    &rem - - B C

schtasks /Delete /tn "\Microsoft\Windows\EDP\EDP App Launch Task" /f                                          &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\EDP\EDP Auth Task" /f                                                &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\EDP\EDP Inaccessible Credentials Task" /f                            &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\EDP\StorageCardEncryption Task" /f                                   &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /f                     &rem - - - C

schtasks /Delete /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /f                                           &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /f                         &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /f                        &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\Flighting\OneSettings\RefreshCache" /f                               &rem - - - C

schtasks /Delete /tn "\Microsoft\Windows\HelloFace\FODCleanupTask" /f                                         &rem - - - C

schtasks /Delete /tn "\Microsoft\Windows\InstallService\ScanForUpdates" /f                                    &rem - - - C

schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\Installation" /f                         &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /f           &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /f                       &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\License Manager\TempSignedLicenseExchange" /f                        &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Location\Notifications" /f                                           &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Location\WindowsActionDialog" /f                                     &rem - - B C

schtasks /Delete /tn "\Microsoft\Windows\Maintenance\WinSAT" /f                                               &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Management\Provisioning\Cellular" /f                                 &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\Management\Provisioning\Logon" /f                                    &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /f                    &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\MobilePC\HotStart" /f                                                &rem 7 - - -
schtasks /Delete /tn "\Microsoft\Windows\MUI\LPRemove" /f                                                     &rem 7 9 B C

schtasks /Delete /tn "\Microsoft\Windows\NetCfg\BindingWorkItemQueueHandler" /f                               &rem - 9 - -
schtasks /Delete /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /f                                       &rem 7 9 B C

schtasks /Delete /tn "\Microsoft\Windows\PI\SecureBootEncodeUEFI" /f                                          &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /f                       &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Printing\EduPrintProv" /f                                            &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\PushToInstall\Registration" /f                                       &rem - - - C

schtasks /Delete /tn "\Microsoft\Windows\RAC\RacTask" /f                                                      &rem 7 9 - -
schtasks /Delete /tn "\Microsoft\Windows\Ras\MobilityManager" /f                                              &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Registry\RegIdleBackup" /f                                           &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /f                            &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" /f                                 &rem - - B C

schtasks /Delete /tn "\Microsoft\Windows\SettingSync\NetworkStateChangeTask" /f                               &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Setup\EOSNotify" /f                                                  &rem 7 9 - -
schtasks /Delete /tn "\Microsoft\Windows\Setup\EOSNotify2" /f                                                 &rem 7 9 - -
schtasks /Delete /tn "\Microsoft\Windows\Setup\SetupCleanupTask" /f                                           &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /f                                        &rem - 9 - -
schtasks /Delete /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /f                                    &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\SpacePort\SpaceAgentTask" /f                                         &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\SpacePort\SpaceManagerTask" /f                                       &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Speech\HeadsetButtonPress" /f                                        &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask" /f                                   &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" /f                                       &rem - - B C
schtasks /Delete /tn "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /f                                     &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\SystemRestore\SR" /f                                                 &rem 7 9 B C

schtasks /Delete /tn "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /f                        &rem - 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /f                             &rem 7 9 B C

schtasks /Delete /tn "\Microsoft\Windows\UNM\RunUpdateNotificationMgr" /f                                     &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\Reboot" /f                                        &rem - - B -
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\Refresh Settings" /f                              &rem - - B -
schtasks /Delete /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /f                                 &rem - - B !

schtasks /Delete /tn "\Microsoft\Windows\Windows Activation Technologies\ValidationTask" /f                   &rem 7 - - -
schtasks /Delete /tn "\Microsoft\Windows\Windows Activation Technologies\ValidationTaskDeadline" /f           &rem 7 - - -
schtasks /Delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f                           &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /f           &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /f                              &rem 7 9 B C
schtasks /Delete /tn "\Microsoft\Windows\WindowsBackup\ConfigNotification" /f                                 &rem 7 - - -
schtasks /Delete /tn "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /f                               &rem - - B -
schtasks /Delete /tn "\Microsoft\Windows\WindowsUpdate\sih" /f                                                &rem - - B -
schtasks /Delete /tn "\Microsoft\Windows\WindowsUpdate\sihboot" /f                                            &rem - - B -
schtasks /Delete /tn "\Microsoft\Windows\WlanSvc\CDSSync" /f                                                  &rem - - - C
schtasks /Delete /tn "\Microsoft\Windows\WS\Badge Update" /f                                                  &rem - 9 - -
schtasks /Delete /tn "\Microsoft\Windows\WS\License Validation" /f                                            &rem - 9 - -
schtasks /Delete /tn "\Microsoft\Windows\WS\WSRefreshBannedAppsListTask" /f                                   &rem - 9 - -

schtasks /Delete /tn "\Microsoft\XblGameSave\XblGameSaveTask" /f                                              &rem - - B C
schtasks /Delete /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /f                                         &rem - - B -

timeout 3 > nul
